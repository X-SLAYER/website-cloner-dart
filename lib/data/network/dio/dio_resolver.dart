import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_updated_boilerplate/constant/api_paths.dart';
import 'package:flutter_updated_boilerplate/data/network/dio/dio_service.dart';
import 'package:flutter_updated_boilerplate/models/request_error.dart';

Future<Response> getRequest(String endPoint) async {
  final response = await DioService.client.get(
    endPoint,
    options: Options(headers: headers),
  );
  return response;
}

Future<Response> download(String endPoint, String path) async {
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
        }),
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
    log('Error: $response');
    throw RequestError.fromJson(jsonDecode(response.toString()));
  }
}

Future<int> resolveStatusCode(Response response) async => response.statusCode!;

bool isSuccessful(int status) => status >= 200 && status <= 300;
