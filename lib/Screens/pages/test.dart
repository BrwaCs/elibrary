// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);

//   @override
//   State<test> createState() => _testState();
// }

// class _testState extends State<test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
//     getuser(String email) async {
//     var value =
//         await FirebaseFirestore.instance.collection('users').doc(email).get();
//     Users _user = Users.fromMap(value.data() as Map<String, dynamic>);
//     name = _user.name;
//     location = _user.location;
//     phonenumber = _user.phonenumber;
//     this.email = _user.email!;
//     image = await firebase_storage.FirebaseStorage.instance
//         .ref('users/$email')
//         .getDownloadURL();
//     setState(() {});
//   }


// image = await firebase_storage.FirebaseStorage.instance
//         .ref('users/$email')
//         .getDownloadURL();

// image = await firebase_storage.FirebaseStorage.instance
//         .ref('lera nawy fileka bnusa')
//         .getDownloadURL();


// }


