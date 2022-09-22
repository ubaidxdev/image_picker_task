import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker_task/image_picker/image_gallery.dart';
import 'package:image_picker/image_picker.dart';

class SnackBarCheck extends StatefulWidget {
  const SnackBarCheck({super.key});

  @override
  State<SnackBarCheck> createState() => _SnackBarCheckState();
}

class _SnackBarCheckState extends State<SnackBarCheck> {
  File? _image;

  Future getImageGallery() async {
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
        title: Text("Snackbar Check"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: _image != null
                      ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://cdn.pixabay.com/photo/2016/10/13/19/52/woman-1738669_960_720.jpg',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Open Snackbar'),
                onPressed: () {
                  // Get.snackbar(
                  //   "Welcome to Flutter Agency",
                  //   "We are expert in FLutter App Development",
                  //   icon: Icon(Icons.person,
                  //       color: Color.fromARGB(255, 252, 13, 13)),
                  //   snackPosition: SnackPosition.TOP,
                  //   backgroundColor: Colors.amber,
                  // );
                  Get.bottomSheet(
                    SingleChildScrollView(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Container(
                          color: Colors.white,
                          height: 250,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CustomButton(
                                  label: Text("Gallery"),
                                  icon: Icon(Icons.browse_gallery_rounded),
                                  onClick: getImageGallery,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  label: Text("Camera"),
                                  icon: Icon(Icons.camera),
                                  onClick: getImageCam,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
