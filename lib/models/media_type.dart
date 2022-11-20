import 'package:flutter_updated_boilerplate/utils/media_identifier.dart';

enum MediaType { image, audio, video, other }

class MediaModel {
  String? mediaName;
  MediaType? mediaType;
  String? mediaPath;

  String get fileName => mediaPath!.split('/').last;
  String get folderPath =>
      '${mediaPath!.split('/').reversed.skip(1).toList().reversed.join('/')}/';

  MediaModel({
    this.mediaName,
    this.mediaType,
    this.mediaPath,
  });

  MediaModel.fromRegex(RegExpMatch match) {
    mediaName = match.group(1);
    mediaType = findMediaByExtension(match.group(3)!.split('.').last);
    mediaPath = match.group(3);
  }

  @override
  String toString() {
    return 'Name: $mediaName, Type: $mediaType, Path: $mediaPath';
  }
}
