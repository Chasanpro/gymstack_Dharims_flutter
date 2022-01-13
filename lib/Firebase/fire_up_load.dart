import 'dart:ffi';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

double y3 = 0, nw = 0, sum = 0;

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final fire = FirebaseStorage.instance.ref(destination);
      final durl = fire.getDownloadURL().toString();
      return fire.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static Future<String?> networth() async {
    try {
      FirebaseFirestore.instance
          .collection('user-data')
          .get()
          .then((QuerySnapshot querySnapshot) {
        sum = 0;
        for (var doc in querySnapshot.docs) {
          int y1 = int.parse(doc["amount"]!);
          int y2 = int.parse(doc["months"]!);

          print(y1);
          print(y2);
          y3 = (y1 / y2);

          sum = sum + (y3);
          print(sum);
        }
        print("❤️");
        print(sum);
      });

      return "$sum";
    } on FirebaseException catch (e) {
      return "😭😭😭😭😭";
    }
  }

  static Future<String> upget(String destination, File file) async {
    try {
      var fire = await FirebaseStorage.instance
          .ref()
          .child(destination)
          .putFile(file)
          .whenComplete(() => null);
      var durl = await fire.ref.getDownloadURL();
      return durl;
    } on FirebaseException catch (e) {
      return "Something went wrong ";
    }
  }

  static String? write(String name, String ph, String pic, String dop,
      String doj, String m, String a) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('user-data');

    try {
      users
          .add({
            'full_name': name,
            'phone_num': ph,
            'image_url': pic,
            'doj': doj,
            'dop': dop,
            'months': m,
            'amount': a
          })
          // ignore: avoid_print
          .then((value) => print("Ohio"))
          // ignore: avoid_print
          .onError((error, stackTrace) => print("Got some Problem"));
      return "Fine!";
    } on FirebaseException catch (e) {
      return "Something went Wrong ";
    }
  }
}
