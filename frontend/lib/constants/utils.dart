import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 6),
    ),
  );
}

Future<List<File>> pickImage() async {
  List<File> image = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (files != null && files.files.isNotEmpty) {
      var something = files.files[0].path!;

      image.add(File(files.files[0].path!));
      debugPrint(' =================  =======  $something');
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return image;
}

List<int> convertImageToBytes(File image) {
  var bytes = image.readAsBytesSync();
  return bytes;
}
