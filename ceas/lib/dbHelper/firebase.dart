import 'dart:developer';

import 'package:ceas/dbHelper/datamodels.dart';
import 'package:ceas/theme/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final firebaseApp = Firebase.app();
FirebaseFirestore data = FirebaseFirestore.instance;

getCountrydetails() async {
  QuerySnapshot countryDetails;

  // countryDetails = await data.collection("Countries").doc(selectedCountry);
  var something = await data.collection("Countries").doc(selectedCountry).get();

  // log(something.data().toString());
  GeneralInfo generalinfo = GeneralInfo(description: "", educationPolicy: "");
  generalinfo = GeneralInfo.fromJson(something.data()!);

  // log("Description : ${generalinfo.description}");
  // log("Education Policy : ${generalinfo.educationPolicy}");
  countryInfo = GeneralInfo(
    description: generalinfo.description,
    educationPolicy: generalinfo.educationPolicy,
  );
}

getLinks(String path, String filter) async {
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

  links = [];

  for (var v in value.docs) {
    Map<String, dynamic> data = v.data() as Map<String, dynamic>;
    links.add(Links.fromJson(data));
  }

  // for (var i in links) {
  //   print("--------------------------");
  //   print("Category : ${i.category}");
  //   print("Url      : ${i.url}");
  //   print("Heading  : ${i.heading}");
  // }

  // print(links.runtimeType);
}
