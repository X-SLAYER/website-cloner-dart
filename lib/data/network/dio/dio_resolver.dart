import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:website_cloner/data/network/dio/dio_service.dart';
import 'package:website_cloner/models/request_error.dart';

Future<Response> getRequest(
  String endPoint, [
  Map<String, dynamic>? headers = const {},
]) async {
  final response = await DioService.client.get(
    endPoint,
    options: Options(headers: headers),
  );
  return response;
}

Future<Response> download(
  String endPoint,
  String path, [
  Map<String, dynamic>? headers = const {},
]) async {
  final response = await DioService.client.get(
    endPoint,
    onReceiveProgress: (count, total) {
      if (total != -1) {
        if (kDebugMode) {
          print("${(count / total * 100).toStringAsFixed(0)}%");
        }
      }
    },
    options: Options(
      headers: headers,
      responseType: ResponseType.bytes,
      followRedirects: false,
      validateStatus: (status) {
        return status != 500;
      },
    ),
  );
  File file = File(path);
  var raf = file.openSync(mode: FileMode.write);
  raf.writeFromSync(response.data);
  await raf.close();
  return response;
}

Future resolveResponse(Response response) async {
  if (isSuccessful(response.statusCode!)) {
    try {
      return jsonDecode(response.toString());
    } catch (e) {
      return response.toString();
    }
  } else {
    log('Error: $response , ${response.statusCode}');
    throw RequestError(
      code: response.statusCode,
      message: response.statusMessage,
      result: response.data,
    );
  }
}

Future<bool> resolveDownload(Response response) async {
  if (response.data != null) {
    return true;
  } else {
    log('Error: $response , ${response.statusCode}');
    throw RequestError(
      code: response.statusCode,
      message: response.statusMessage,
      result: response.data,
    );
  }
}

Future<int> resolveStatusCode(Response response) async => response.statusCode!;

bool isSuccessful(int status) => status >= 200 && status <= 300;
