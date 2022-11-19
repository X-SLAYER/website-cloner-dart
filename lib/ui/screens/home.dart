import 'dart:developer';
import 'dart:io';

import 'package:ez_validator/validator/ez_validator_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_updated_boilerplate/constant/regex_list.dart';
import 'package:flutter_updated_boilerplate/data/network/dio/dio_handler.dart';
import 'package:flutter_updated_boilerplate/models/media_type.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/media_identifier.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/widget_extensions.dart';
import 'package:flutter_updated_boilerplate/utils/modals/app_modals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isLoading = false;
  final urlValidator = EzValidator().url().build();
  final TextEditingController urlController = TextEditingController();
  List<MediaModel> mediaList = [];

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  void getContent() async {
    setLoading(true);
    mediaList.clear();
    Directory('/home/slayer/Desktop/test/assets')
        .create(recursive: true)
        .then((Directory directory) {
      log(directory.path);
    });
    DioHandler.getWebsiteContent(urlController.text).then((response) async {
      File('/home/slayer/Desktop/test/assets/test.html')
          .writeAsString(response)
          .then((value) {
        log('File written');
      });
      RegExp(mediaRegex).allMatches(response).forEach((match) {
        if ((!match.group(3).isEmptyOrNull) &&
            urlValidator(match.group(3)!) != null &&
            isValidMedia(match.group(3)!)) {
          final model = MediaModel.fromRegex(match);
          log('message: $model \n', name: 'MATCHED-ASSETS');
          mediaList.add(model);
        }
      });
      await Future.forEach<MediaModel>(mediaList.map((e) => e),
          (element) async {
        final path = await Directory(
                '/home/slayer/Desktop/test/assets/${element.folderPath}')
            .create(recursive: true);
        log('path: ${path.path}');
        await DioHandler.downloadFile(
          '${urlController.text}${element.mediaPath}',
          '${path.path}${element.fileName}',
        );
      });
      setLoading(false);
    }).catchError((error) {
      log('$error');
      setLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'Enter URL',
              ),
              validator: EzValidator().required().url().build(),
            ),
            TextButton(
              onPressed: () {
                if (urlValidator(urlController.text) != null) {
                  Toastr.showStaticModal(
                    context,
                    'Error',
                    'Please enter a valid URL',
                  );
                  return;
                }
                if (isLoading) return;
                getContent();
              },
              child: isLoading
                  ? const SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: CircularProgressIndicator(),
                    )
                  : const Text('Download'),
            ),
          ],
        ).paddingHV(h: 25.0),
      ),
    );
  }
}
