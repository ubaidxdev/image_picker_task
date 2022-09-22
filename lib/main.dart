import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_task/image_picker/image_gallery.dart';

void main() {
  runApp(const MyApp());
}

final _formKey = GlobalKey<FormState>();

Map<String, dynamic> productData = {
  "p_name": "",
  "p_price": "",
  "p_upload": DateTime.now().millisecondsSinceEpoch,
  "phone_number": ""
};

var pickedImage;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ImagePickedClass()
        //  ImageUpload(),
        );
  }
}

// class ImageUpload extends StatefulWidget {
//   const ImageUpload({Key? key}) : super(key: key);

//   @override
//   State<ImageUpload> createState() => _ImageUploadState();
// }

// class _ImageUploadState extends State<ImageUpload> {
//   addProduct() {
//     if (pickedImage == null) {
//       Get.snackbar(
//         "0oops",
//         "Khwand yi wa na ko",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.amber[200],
//         colorText: Colors.white,
//       );
//       return;
//     }
//     _formKey.currentState!.save();
//     if (_formKey.currentState!.validate()) {
//       print("Form is valid");
//       print('data added successfully');

//       print('Data for Logi $productData');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Your Product with image'),
//       ),
//       body: Card(
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               shrinkWrap: true,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   // ignore: prefer_const_constructors
//                   decoration: InputDecoration(labelText: 'Product Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Product Name Required';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     productData['p_name'] = value!;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   // ignore: prefer_const_constructors
//                   decoration: InputDecoration(
//                     labelText: 'Phone Number',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Phone Number Required';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     productData['phone_number'] = value!;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   // ignore: prefer_const_constructors
//                   decoration: InputDecoration(labelText: 'Product Price'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Product Price Required';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     productData['p_price'] = value!;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Product_picker(getImageValue: pickedImage),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Product_picker extends StatefulWidget {
//   Product_picker({required this.getImageValue, Key? key}) : super(key: key);

//   final void Function(File pickedImage)? getImageValue;

//   @override
//   State<Product_picker> createState() => _Product_pickerState();
// }

// class _Product_pickerState extends State<Product_picker> {
//   void imagePickerOption() {
//     Get.bottomSheet(
//       SingleChildScrollView(
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20.0.r), topRight: Radius.circular(20.r)),
//         child: Container(
//           color: Colors.white,
//           height: 250,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(
//                 'Pick an Image From',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   pickedImage(ImageSource.camera);
//                 },
//                 icon: Icon(Icons.camera),
//                 label: Text('Camera'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   pickedImage(ImageSource.gallery);
//                 },
//                 icon: Icon(Icons.browse_gallery),
//                 label: Text('Gallery'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   Get.back();
//                 },
//                 icon: Icon(Icons.close),
//                 label: Text('Close'),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(
//           onTap: imagePickerOption,
//           child: Container(
//             width: 100,
//             height: 100,
//             child: pickedImage != null
//                 ? Image.file(
//                     pickedImage,
//                     fit: BoxFit.cover,
//                   )
//                 : Image.network(
//                     'https://static.thenounproject.com/png/2413564-200.png',
//                     fit: BoxFit.cover,
//                   ),
//           ),
//         ),
//         ElevatedButton.icon(
//           onPressed: imagePickerOption,
//           icon: Icon(Icons.image),
//           label: Text('Add Image'),
//         ),
//       ],
//     );
//   }

//   pickImage(ImageSource imageType) async {
//     final ImagePicker _picker = ImagePicker();
//     try {
//       final photo = await _picker.pickImage(source: imageType);
//       if (photo == null) return;
//       final tempImage = File(photo.path);
//       print("This is image path ${photo.path}");
//       setState(() {
//         pickedImage = tempImage;
//       });
//       Get.back();
//     } catch (error) {
//       print(error);
//     }
//   }
// }
