import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    ),
  );
}

Future<File> pickImage() async {
  late File image;
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (files != null && files.files.isNotEmpty) {
      image = File(files.files[0].path!);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return image;
}
