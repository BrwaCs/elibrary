import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool _displayNameValid = true;
  bool _bioValid = true;

  File? file;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel logedInUser = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection("user")
              .doc(user!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingIndicator();
            } else if (snapshot.hasError) {
              return Text("Error...");
            } else if (snapshot.data == null) {
              return Text("Data is null");
            }

            UserModel theUserModel =
                UserModel.fromSnapShot(snapshot.data as DocumentSnapshot);

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          autofocus: false,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{5,}$');
                            if (value!.isEmpty) {
                              return ("Name cannot be Empty");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Enter Valid name(Min. 5 Character)");
                            }
                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(Icons.person),
                              hintText: "Enter Name",
                                //  errorText: _displayNameValid ? null : "Display Name too short",
                              labelText: "${theUserModel.fullName}",
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                         
                          maxLines: 4,
                          controller: bioController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "${theUserModel.bio}",
                            hintText: "Enter bio",
                            // errorText: _bioValid ? null : "Bio too long",
                            hintStyle: TextStyle(
                                fontSize: 16, height: 1.25, wordSpacing: 1.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 42,
                        width: 210,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            primary: Theme.of(context)
                                .primaryColor, // background (button) color
                            onPrimary: Colors.white, // foreground (text) color
                          ),
                          onPressed: () {
                          //   if (nameController.text == null) {
                          //   notupdateProfile(context);
                          //   } else if (bioController.text == null) {
                          //  notupdateProfile(context);
                          //   } else {
                              updateProfile(context);
                            // }
                          },
                          child: const Text('Update Profile'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  notupdateProfile(BuildContext context) async {
    Get.snackbar("Not Update", "not update information");
    Get.to(() => Profile());
  }

  updateProfile(BuildContext context) async {

   setState(() {
      nameController.text.length <= 5 
          ? _displayNameValid = false 
          : _displayNameValid = true;
      bioController.text.length > 150 || bioController.text.isEmpty
          ? _bioValid = false
          : _bioValid = true;
         

    });

        if (_displayNameValid ==true&& _bioValid==true) {
        Map<String, dynamic> map = Map();

    map['firstName'] = nameController.text;
    map['bio'] = bioController.text;
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(map);
    Get.snackbar("Updating...", "Profile information updated");
    Get.to(() => Profile());

    setState(() {});
     
  } else if (_bioValid==false&&_displayNameValid==true) {
        Map<String, dynamic> map = Map();

    map['firstName'] = nameController.text;
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(map);
    Get.snackbar("Profile Name", "Profile information updated");
    Get.to(() => Profile());

    setState(() {});
     
  }
  else if (_bioValid==true&&_displayNameValid==false) {
        Map<String, dynamic> map = Map();

    map['bio'] = bioController.text;
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(map);
    Get.snackbar("Profile Bio", "Profile information updated");
    Get.to(() => Profile());

    setState(() {});
     
  }
  
  else{
     Get.snackbar("Not Update", "not update information");
    Get.to(() => Profile());
  }
 




  }
}
