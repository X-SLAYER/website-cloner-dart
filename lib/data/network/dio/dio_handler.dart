import 'package:website_cloner/data/network/dio/dio_resolver.dart';

class DioHandler {
  DioHandler._();

  static Map<String, dynamic>? headers = const {};

  static Future getWebsiteContent(String url) async {
    return resolveResponse(
      await getRequest(url, headers),
    );
  }

  static Future<bool> downloadFile(String url, String path) async {
    return resolveDownload(
      await download(url, path, {}),
    );
  }
}
