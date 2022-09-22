import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_task/image_picker/simple_page.dart';

class ImagePickedClass extends StatefulWidget {
  ImagePickedClass({super.key});

  @override
  State<ImagePickedClass> createState() => _ImagePickedClassState();
}

class _ImagePickedClassState extends State<ImagePickedClass> {
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final ImageTemp = File(image.path);
    setState(() {
      this._image = ImageTemp;
    });
  }

  Future getImageCam() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final ImageTemp = File(image.path);
    setState(() {
      this._image = ImageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://cdn.pixabay.com/photo/2016/10/13/19/52/woman-1738669_960_720.jpg",
                            fit: BoxFit.cover,
                            width: 200,
                            // height: 200,
                          ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 25,
                  child: InkWell(
                    onTap: () {
                      print('Pressed the imaged');
                      Get.snackbar("Welcome to Flutter Agency",
                          "We are expert in FLutter App Development",
                          icon: Icon(Icons.person, color: Colors.red),
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.amber);
                      print('Pressed the imaged');
                    },
                    child: Icon(
                      Icons.camera_alt,
                      size: 150,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                )
              ],
            ),
            CustomButton(
              icon: Icon(Icons.browse_gallery),
              label: Text('Gallerry'),
              onClick: getImage,
            ),
            CustomButton(
              label: Text('Camera'),
              icon: Icon(Icons.camera),
              onClick: getImageCam,
            ),
            CustomButton(
                label: Text("Snackbar"),
                icon: Icon(Icons.next_plan),
                onClick: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SnackBarCheck();
                  }));
                }))
          ],
        ),
      ),
    );
  }
}

Widget CustomButton({
  required Widget label,
  required Icon icon,
  required VoidCallback onClick,
}) {
  return Container(
    child: ElevatedButton.icon(
      onPressed: onClick,
      icon: icon,
      label: label,
    ),
  );
}
