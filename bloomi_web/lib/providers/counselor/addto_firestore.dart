import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StorageData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;

    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    //required String name,
    required Uint8List file,
  }) async {
    String resp = "Some Error Occurred";
    try {
      String imageUrl = await uploadImageToStorage('profileImage', file);
      await _firestore.collection('counselorProfile').add({
        //'name': name,
        'imageUrl': imageUrl,
      });
      resp = 'success';
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }
}
