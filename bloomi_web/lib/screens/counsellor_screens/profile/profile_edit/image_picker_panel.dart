import 'dart:async';
import 'dart:io';

import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/counselor/addto_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({
    super.key,
  });

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? image;
  Uint8List? _image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      String resp = await StorageData().saveData(file: _image!);
      if (image != null) {
        return await image.readAsBytes();
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    return null;
  }

  void selectImage(int x) async {
    Uint8List img;
    if (x == 1) {
      img = await pickImage(ImageSource.gallery);
    } else {
      img = await pickImage(ImageSource.camera);
    }
    setState(() {
      _image = img;
    });
  }

/*
  Future<void> uploadImage() async {
    try {
      if (image == null) return;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now()}.jpg');
      final uploadTask = storageRef.putFile(image!);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });

      // Store the download URL in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc('user_id')
          .update({'profileImageUrl': imageUrl});
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          height: 400,
          width: 300,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          decoration: BoxDecoration(
            color: UtilConstants.lightgreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            image != null
                ? ClipOval(
                    child: Image.memory(
                      _image!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  )
                : ClipOval(
                    child: Image.asset(
                      UtilConstants.profImagePath,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Change Profile Image",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: UtilConstants.primaryColor,
                  fontSize: 20),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ElevatedButton(
                onPressed: () {
                  selectImage(1);
                },
                child: Container(
                    width: 140,
                    height: 15,
                    alignment: Alignment.center,
                    child: const Row(
                      children: [
                        Icon(Icons.camera_alt,
                            size: 15, color: UtilConstants.primaryColor),
                        SizedBox(width: 10),
                        Text(
                          'Select from Gallery',
                          style: TextStyle(
                              fontSize: 12, color: UtilConstants.primaryColor),
                        ),
                      ],
                    ))),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  selectImage(0);
                },
                child: Container(
                    width: 140,
                    height: 15,
                    alignment: Alignment.center,
                    child: const Row(
                      children: [
                        Icon(Icons.camera_alt,
                            size: 15, color: UtilConstants.primaryColor),
                        SizedBox(width: 10),
                        Text(
                          'Take Using Camera',
                          style: TextStyle(
                              fontSize: 12, color: UtilConstants.primaryColor),
                        ),
                      ],
                    ))),
          ]),
        )),
      ),
      bottomNavigationBar: Footer(height: 55, width: width),
    );
  }
}
