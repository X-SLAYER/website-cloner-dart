import 'package:flutter/cupertino.dart';
import 'package:website_cloner/constant/media_extensions.dart';
import 'package:website_cloner/models/media_type.dart';

MediaType findMediaByExtension(String extension) {
  MediaType result = MediaType.other;
  for (var ext in mediaExtensions.keys) {
    if (mediaExtensions[ext]!.contains(extension)) {
      result = ext;
      break;
    }
  }
  return result;
}

IconData getIconByMediaType(MediaType mediaType) {
  IconData result = CupertinoIcons.question_circle;
  switch (mediaType) {
    case MediaType.image:
      result = CupertinoIcons.photo;
      break;
    case MediaType.video:
      result = CupertinoIcons.video_camera;
      break;
    case MediaType.audio:
      result = CupertinoIcons.music_note;
      break;
    case MediaType.other:
      result = CupertinoIcons.chevron_left_slash_chevron_right;
      break;
  }
  return result;
}

String urlCleaner(String url) => url.endsWith('/') ? url : '$url/';
String schemaCleaner(String url) =>
    url.startsWith('/') ? url.substring(1) : url;

bool isValidMedia(String media) => media.split('.').length >= 2;
