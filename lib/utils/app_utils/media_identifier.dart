import 'package:flutter_updated_boilerplate/constant/media_extensions.dart';
import 'package:flutter_updated_boilerplate/models/media_type.dart';

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

bool isValidMedia(String media) => media.split('.').length >= 2;
