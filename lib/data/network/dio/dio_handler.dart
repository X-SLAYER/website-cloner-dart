import 'package:website_cloner/data/network/dio/dio_resolver.dart';

class DioHandler {
  DioHandler._();

  static Map<String, dynamic>? headers = const {};

  static Future getWebsiteContent(String url) async {
    return resolveResponse(
      await getRequest(url, headers),
    );
  }

  static Future downloadFile(String url, String path) async {
    return resolveResponse(
      await download(url, path, {}),
    );
  }
}
