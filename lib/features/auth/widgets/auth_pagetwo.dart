import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../common/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';

class AuthPageTwo extends StatefulWidget {
  final int pageNumber;
  final int maxPage;
  final VoidCallback pageStateDecrement;
  final VoidCallback pageStateIncrement;
  const AuthPageTwo({
    Key? key,
    required this.pageStateDecrement,
    required this.pageStateIncrement,
    required this.pageNumber,
    required this.maxPage,
  }) : super(key: key);

  @override
  State<AuthPageTwo> createState() => _AuthPageTwoState();
}

class _AuthPageTwoState extends State<AuthPageTwo> {
  final _basicInforKey = GlobalKey<FormState>();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  List<File> profilePicture = [];
  late int pageNumber;
  late int maxPage;

  @override
  void initState() {
    super.initState();
    pageNumber = widget.pageNumber;
    maxPage = widget.maxPage;
  }

  @override
  void dispose() {
    super.dispose();
    _businessNameController.dispose();
    _businessIdController.dispose();
    _addressController.dispose();
  }

  void selectImage() async {
    var res = await pickImage();
    setState(() {
      profilePicture = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _basicInforKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "Fill out this form carefully, please!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
            ),
            const SizedBox(height: 40),
            profilePicture.isNotEmpty
                ? SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.file(profilePicture[0]))
                : GestureDetector(
                    onTap: selectImage,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.folder_open,
                              size: 40,
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Select profile picture",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 15),
            CustomTextField(
                controller: _businessNameController, hintText: "Business name"),
            const SizedBox(height: 10),
            CustomTextField(
                controller: _businessIdController,
                hintText: "Business / Tax id"),
            const SizedBox(height: 10),
            CustomTextField(
                controller: _addressController,
                hintText: "Address - exmaple: Region, City"),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: widget.pageStateDecrement,
                  child: const Text(
                    "Previous",
                    style: TextStyle(color: GlobalVariables.primaryColor),
                  ),
                ),
                Text(
                  "$pageNumber/$maxPage",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 166, 166, 166),
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: widget.pageStateIncrement,
                  child: const Text(
                    "Next",
                    style: TextStyle(color: GlobalVariables.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
