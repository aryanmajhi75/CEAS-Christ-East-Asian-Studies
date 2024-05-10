import 'dart:developer';

import 'package:ceas/dbHelper/datamodels.dart';
import 'package:ceas/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final firebaseApp = Firebase.app();
FirebaseFirestore data = FirebaseFirestore.instance;

getLinks(String path, String filter) async {
  List<Links> links = [];

  QuerySnapshot value;

  if (filter == "") {
    value = await data
        .collection("Countries")
        .doc(selectedCountry)
        .collection(path)
        .get();
  } else {
    value = await data
        .collection("Countries")
        .doc(selectedCountry)
        .collection(path)
        .where('category', isEqualTo: filter)
        .get();
  }

  for (var v in value.docs) {
    Map<String, dynamic> data = v.data() as Map<String, dynamic>;
    links.add(Links.fromJson(data));
  }

  for (var i in links) {
    print("Category : ${i.category}");
    print("Url      : ${i.url}");
    print("Heading  : ${i.heading}");
  }

  return links;
}
