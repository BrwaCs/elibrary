
// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/Provider/user_provider.dart';

import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class SecondProfile extends StatefulWidget {
  const SecondProfile({Key? key}) : super(key: key);

  @override
  State<SecondProfile> createState() => _SecondProfileState();
}

// when we login user name in SecondProfile is null after hot relod in display name why ?

class _SecondProfileState extends State<SecondProfile> {

  late String fileName;
//auth statechange
User? user=FirebaseAuth.instance.currentUser;
UserModel logedInUser=UserModel();


  @override
  Widget build(BuildContext context) {
     UserModel userModel = context.watch<UserProvider>().Userdata!;
    //future biulder
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "${userModel.fullName} ",
          style: TextStyle(
            fontSize:24,
            fontWeight:FontWeight.normal,
            color:Colors.black
          )
          ),
          centerTitle: true,    
    
    // black line of the bottom AppBar
    bottom: PreferredSize(
      // ignore: sort_child_properties_last
      child: Container(
         color: Colors.black,
         height: 1.0,
      ),
      preferredSize: Size.fromHeight(1.5)
      ),
      iconTheme: IconThemeData(color:Theme.of(context).primaryColor),
      ),
 body:FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
future: FirebaseFirestore.instance.collection("user").doc(user!.uid).get(),
builder: (context,snapshot) {
  if(snapshot.connectionState==ConnectionState.waiting){
    return LoadingIndicator();
  }else if(snapshot.hasError){
    return Text("Error...");
  }else if(snapshot.data ==null){
    return Text("Data is null");
  }

  UserModel theUserModel=UserModel.fromSnapShot(snapshot.data as DocumentSnapshot);

  return Column(
          children: [
          SizedBox(height: 35,),
            GestureDetector(
            
              child: Row(
                     mainAxisAlignment:MainAxisAlignment.center,
                     children: [
                Container(
                
                child: theUserModel.imageUrl==null ?
                Stack(
                 children: [
                 Container(
                    height: 108,
                    width: 100,
                     child:
                 CircleAvatar(
                 backgroundColor: Colors.black,
                 radius: 60,
                 
                  backgroundImage:
                  AssetImage("assets/images/profile.png"),
               )
                ),
               
                 ],             
               )
               :Stack(
                 children: [
                     Container(
                    height: 108,
                    width: 100,
                    child:CircleAvatar(
                   radius: 60,
                    backgroundImage:
                    NetworkImage(theUserModel.imageUrl.toString())
                 )
                  ),
           
                 ],             
               )
              )
               
                     ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
              Text(
                "${theUserModel.fullName}",
                style: TextStyle(
                  fontSize:18,
                  fontWeight: FontWeight.w500
      
                ),
              )
            ],
            ),
            
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Text("bio",
                  style: TextStyle(
                    fontSize:18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left:7.0,right: 15),
              child: Row( 
                mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>[ 
                  Container( width: 14.0, ),
                   Flexible( 
                     child: theUserModel.bio==null?Text("Write your bio here",style: TextStyle(color:Colors.grey),): Text("${theUserModel.bio}",
                     style: TextStyle(
                      fontSize: 16,
                      height: 1.25,
                      wordSpacing: 1.1
                     )
                     ),
                   ) 
                   ], 
                   ),
            ),
                 SizedBox(height: 20,),
            Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize:16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            ),
            
          ],
        
        );
        }
 )
    );
    
  }



}