
// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/Provider/user_provider.dart';
import 'package:elibrary/Screens/pages/profile.dart';

import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/ReviewDataModel.dart';
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


class SecondProfile extends StatelessWidget {
 SecondProfile({Key? key, required this.ModelUser}) : super(key: key);
 final UserModel ModelUser;
   late String fileName;
//auth statechange
User? user=FirebaseAuth.instance.currentUser;
UserModel logedInUser=UserModel();


  @override
  Widget build(BuildContext context) {
    //  UserModel userModel = context.watch<UserProvider>().Userdata!;
    //future biulder
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "${ModelUser.fullName} ",
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
 body:StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
stream: FirebaseFirestore.instance.collection("user")
.where("uid", isEqualTo: ModelUser.uid)
.snapshots(),
builder: (context,snapshot) {
  if(snapshot.connectionState==ConnectionState.waiting){
    return LoadingIndicator();
  }else if(snapshot.hasError){
    return Text("Error...");
  }else if(snapshot.data ==null){
    return Text("Data is null");
  }
List<UserModel> theUserModel = snapshot.data!.docs
                  .map((e) => UserModel.fromSnapShot(e))
                  .toList();

  return ListView.builder(
  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemCount: theUserModel.length,
                  itemBuilder: ((context, index) {
                    return 
  
  SingleChildScrollView(
    child: SizedBox(
      height: 1000,
      child: Column(
              children: [
              SizedBox(height: 35,),
                GestureDetector(
                
                  child: Row(
                         mainAxisAlignment:MainAxisAlignment.center,
                         children: [
                 Container(
                    
                    child: theUserModel[index].imageUrl==null ?
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
                        NetworkImage(theUserModel[index].imageUrl.toString())
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
                    "${theUserModel[index].fullName}",
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
                         child: theUserModel[index].bio==null?Text("Write your bio here",style: TextStyle(color:Colors.grey),): Text("${theUserModel[index].bio}",
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
      
      
      
      
      
                 SizedBox(height: 20,),
      
      FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance.collection("Review").get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingIndicator();
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error..."));
                  } else if (snapshot.data == null) {
                    return Center(child: Text("Data is null"));
                  }
      // create a liat of book models from fire store  query snapshot
                  List<ReviewDataModel> Review_model = snapshot.data!.docs
                      .map((e) => ReviewDataModel.fromMap(e.data()))
                      .toList();
                  
      return   Expanded(
        child: ListView.builder(
         
                           itemCount: Review_model.length,
                          itemBuilder: (context, index) {
          return Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          height: 175,
                          width: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color: Color.fromARGB(255, 235, 235,235),
                          ), 
                          child: Column(
                            children: [
                              Row(
                                children: [
                                 Flexible( 
                                fit: FlexFit.tight,
                                   child: Container(
                                     height: 38,
                                     width: 320,
                                     child: Row(
                                       children: [
                                             Container(
                                   
                                    child: Review_model[index].userImage?.toString()=="null" ?
                                    GestureDetector(
                                       onTap: () {
                                        if(FirebaseAuth.instance.currentUser!.uid== Review_model[index].uid){
      
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                                       }else{
      
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondProfile()));
                                       }
                                                     },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:8.0,top:7,right: 5),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          image: DecorationImage(
                                            
                                            fit: BoxFit.fill,
                                            image:
                                                AssetImage("assets/images/profile.png"),
                                          ),
                                        ),
                                        ),
                                      ),
                                    )
                                    : GestureDetector(
                                       onTap: () {
                                         if(FirebaseAuth.instance.currentUser!.uid== Review_model[index].uid){
      
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                                       }else{
      
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondProfile()));
                                       }
                                                     },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:8.0,top:7,right: 5),
                                        child: Container(
                                           height: 30,
                                        width: 30,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          image: DecorationImage(
                                            
                                            fit: BoxFit.fill,
                                            image:
                                                NetworkImage(Review_model[index].userImage.toString()),
                                          ),
                                        ),
                                        ),
                                      ),
                                    )
                 
                                  ),
                                        //  Padding(
                                        //    padding: const EdgeInsets.all(8.0),
                                        //    child: GestureDetector(
                                        //    onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                                        //              },
                                        // child: Icon(
                                        // IconData(0xee35, fontFamily: 'MaterialIcons'),
                                        // size: 26.0,   
                                        //    ),
                                        //    ),
                                        //  ),
                                         Padding(
                                           padding: const EdgeInsets.only(top:10),
                                           child: Text("${Review_model[index].userName}",
                                           style: TextStyle(
                                             fontSize: 14,fontWeight: FontWeight.normal
                                           ),),
                                         ),
         
         
                                       ],
                                     ),
                                   )
                                   )
                                ],
                              ),
                              Divider(
                                thickness: 0.8,
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                 Flexible( 
                                fit: FlexFit.tight,
                                   child: Container(
         
                                     height: 66,
                                     width: 320,
                                     child: Row( 
                                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                                      children: <Widget>[ 
                                      // Container( width: 14.0, ),
                                     Flexible( 
                                    child: Text("${Review_model[index].review}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                  fontSize: 14,
                                 height: 1.25
                           )
                           ),
                         ) 
                         ], 
                         ), 
                                   )
                                   )
                                ],
                              ),
                               Divider(
                                thickness: 0.8,
                                color: Colors.black,
                              ),
                              Row(
                                
                                children: [
                                 Flexible( 
                                fit: FlexFit.tight,
                                   child: Container(
                                   
                                     height: 35,
                                     width: 320,
                                     child: Center(
                                       child: Text("${Review_model[index].bookName}", 
                                       style: 
                                       TextStyle(
                                         fontSize: 16,
                                         fontWeight: FontWeight.normal,
                                       ),),
                                     ),
                                   )
                                   )
                                ],
                              ),
                            ],
                          )
                          ),
                        ),
                      ),
                    
              
                  ]
                );
           }
        ),
      );
       
                }
       )
                
              ],
            
            ),
    ),
  );
        }
   )
    );
    
  }



)
    );
}
}