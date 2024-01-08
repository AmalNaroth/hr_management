import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hr_management_new/config/size_utils/size_utils.dart';
import 'package:image_picker/image_picker.dart';

XFile? imagePath;

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
   _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Future<void> getImge(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          title: const Text("Select your choice"),
          actions: [
            IconButton(
              onPressed: () async {
                final _image =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                if (_image != null) {
                  setState(() {
                    imagePath = _image;
                  });
                  Navigator.of(context).pop();
                }
              },
              icon: Image.asset(
                "assets/images/camera_image.jpg",
                height: 80,
                width: 80,
              ),
            ),
            IconButton(
              onPressed: () async {
                final _image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (_image != null) {
                  setState(() {
                    imagePath = _image;
                  });
                  Navigator.of(context).pop();
                }
              },
              icon: Image.asset(
                "assets/images/gallery_image.jpg",
                height: 80,
                width: 80,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double circleAvatarRadius =
        50.0; // Replace with a specific value or calculation

    return GestureDetector(
      onTap: () {
        getImge(context);
      },
      child: CircleAvatar(
        radius: circleAvatarRadius,
        backgroundColor: Colors.transparent,
        backgroundImage: imagePath == null
            ? AssetImage("assets/images/userImage.jpg")
            : null,
        child: imagePath != null
            ? ClipOval(
                child: Image.file(
                  File(imagePath!.path),
                  width: mWidth! * .18,
                  height: mWidth! * .18,
                  fit: BoxFit.cover,
                ),
              )
            : null,
      ),
    );
  }
}

Future<Uint8List> selectImage() async {
  Uint8List? img;

  if (imagePath != null) {
    img = await imagePath!.readAsBytes();
  }

  return img!;
}
