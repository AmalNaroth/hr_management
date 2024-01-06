import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:image_picker/image_picker.dart';

XFile? imagePath;

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  // Change File to XFile
  bool _imageSelect = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImge(context);
      },
      child: CircleAvatar(
        radius: mWidth! * .18,
        backgroundColor: Colors.transparent,
        backgroundImage: imagePath == null
            ? AssetImage("assets/images/userImage.jpg")
            : null,
        child: imagePath != null
            ? ClipOval(
                child: Image.file(
                  File(imagePath!.path), // Convert XFile to File
                  width: mWidth! * .18 * 2,
                  height: mWidth! * .18 * 2,
                  fit: BoxFit.cover,
                ),
              )
            : null,
      ),
    );
  }

  Future<void> getImge(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          title: const Text("Select your choice"),
          actions: [
            GestureDetector(
              onTap: () async {
                final _image =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (_image != null) {
                  setState(() {
                    imagePath = _image;
                    _imageSelect = false;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/camera_image.jpg",
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final _image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (_image != null) {
                  setState(() {
                    imagePath = _image;
                    _imageSelect = false;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/gallery_image.jpg"),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
