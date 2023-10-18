import 'dart:async';

import 'package:bloomi_web/components/form_button_web.dart';
import 'package:bloomi_web/providers/users/user_provider.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({
    super.key,
  });

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  Uint8List? _image;

  Future pickImage(ImageSource source) async {
    XFile? file = await ImagePicker().pickImage(source: source);

    if (file != null) {
      return await file.readAsBytes();
    }
    Logger().e("No images selected");
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          scrollable: true,
          content: SingleChildScrollView(
              child: Container(
            height: 400,
            width: width < 480 ? width * 0.7 : 300,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
            decoration: BoxDecoration(
              color: UtilConstants.lightgreyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              const Text(
                "Upload Image",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: UtilConstants.primaryColor,
                    fontSize: 20),
              ),
              const SizedBox(height: 30),
              _image != null
                  ? SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundImage: MemoryImage(_image!),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(value.userModel!.imgUrl),
                        ),
                      ),
                    ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    selectImage();
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
                                fontSize: 12,
                                color: UtilConstants.primaryColor),
                          ),
                        ],
                      ))),
              SizedBox(
                height: height * 0.05,
              ),
              Consumer<UserProvider>(
                builder: (context, value, child) {
                  return InkWell(
                    onTap: () {
                      /*value.updateCounselor(
                        value.counsellorModel!.name,
                        value.counsellorModel!.email,
                        value.counsellorModel!.phone,
                        value.counsellorModel!.faculty,
                        value.counsellorModel!.userCredential,
                        value.counsellorModel!.userType,
                        context,
                        value.counsellorModel!.uid,
                        utf8.decode(_image!),
                      );*/
                      //upload image
                      Navigator.of(context).pop();
                    },
                    child: const FormButtonWeb(
                      'Upload',
                      width: 100,
                      height: 30,
                      fontSize: 12,
                      isLoading: true,
                    ),
                  );
                },
              ),
            ]),
          )),
        );
      },
    );
  }
}
