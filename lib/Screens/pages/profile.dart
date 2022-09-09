
// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/Provider/user_provider.dart';
import 'package:elibrary/Screens/pages/SecondProfile.dart';
import 'package:elibrary/Screens/pages/review.dart';
import 'package:elibrary/Screens/pages/update_profile.dart';
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

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

// when we login user name in profile is null after hot relod in display name why ?

class _ProfileState extends State<Profile> {

  late String fileName;
//auth statechange
User? user=FirebaseAuth.instance.currentUser;
UserModel logedInUser=UserModel();


//  initState() {
//   super.initState();
   
//    FirebaseFirestore.instance.collection("user")
//   .doc(user!.uid)
//   .get()
//   .then((value) => {
//   this.logedInUser=UserModel.fromMap(value.data() as Map<String, dynamic>) 
//   });
// }
 String imageUrl="";
//   final ImagePicker _picker= ImagePicker();
// XFile? _selectImage;
  @override
  Widget build(BuildContext context) {
     UserModel userModel = context.watch<UserProvider>().Userdata!;
    //future biulder
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Profile ",
          style: TextStyle(
             fontFamily: "english",
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
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: Size(95, 27),
                    // Foreground color
                    onPrimary: Colors.white,
                    // Background color
                    primary: Color.fromARGB(255, 30, 212, 0),
                              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0),
                              ),
                      onPressed: (){
                      Get.to(()=> EditProfile());
                      },
                              child: Text("Edit",
                              style: TextStyle(
                                 fontFamily: "english",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                              ),
                              ),
                              ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: ElevatedButton(
                      
                     style: ElevatedButton.styleFrom(
                       
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    minimumSize: Size(95, 27),
                    // Foreground color
                    onPrimary: Colors.white,
                    // Background color
                    primary: Color.fromARGB(255, 212, 0, 0),
                              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0),
                              ),
                      onPressed: (){
                         logout(context);
                      },
                              child: Row(
                                children: [
                                  Text("Logout ",
                                  style: TextStyle(
                                     fontFamily: "english",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                                  ),
                                  ),
                                  Icon(
                                    Icons.logout_outlined,
                                    size: 16
                                  )
                                ],
                              ),
                              ),
                  ),
                ),
              ]
            ),
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
                  Positioned(
                    top:46,
                    left:22,
                    height: 100,
                    width: 60,
                    child: IconButton(
                      onPressed: ()async{
                       uploadImage();
                       
                      }, 
                       icon: Icon(Icons.add_circle,color: Colors.red,),   
                       iconSize: 24,
                       )
                    )
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
                 Positioned(
                    top:46,
                    left:22,
                    height: 100,
                    width: 60,
                    child: IconButton(
                      onPressed: ()async{
                       uploadImage();
                      }, 
                       icon: Icon(Icons.add_circle,color: Colors.red,),   
                       iconSize: 24,
                       )
                    )
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
                   fontFamily: "english",
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
                     fontFamily: "english",
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
                     child: theUserModel.bio==null?Text("Write your bio here",style: TextStyle(color:Colors.grey, fontFamily: "english",),): Text("${theUserModel.bio}",
                     style: TextStyle(
                        fontFamily: "english",
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
                       fontFamily: "english",
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
      return FirebaseAuth.instance.currentUser!.uid == Review_model[index].uid ?  Column(
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
                               
                                child: userModel.imageUrl==null ?
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
                                            NetworkImage(userModel.imageUrl.toString()),
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
                                       child: Text("${userModel.fullName}",
                                       style: TextStyle(
                                          fontFamily: "english",
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
                                   fontFamily: "english",
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
                                      fontFamily: "english",
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
              
            )
            :Container();
  
  
                      }
    ),
  );
 
            }
 )
























          ],
        
        );
        }
 )
    );
    
  }
Future<void>logout(BuildContext context)async{

await FirebaseAuth.instance.signOut();

Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));

}





uploadImage() async {
User? user=FirebaseAuth.instance.currentUser;
    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    XFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //select images

      XFile? image=await _imagePicker.pickImage(source: ImageSource.gallery);
      var file=File(image?.path as String);
      
       fileName = basename(file.path);
      if(image !=null){
      //upload image to firebase
      var snapshot=await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(
            FirebaseAuth.instance.currentUser!.uid + "_" + basename(file.path))
        .putFile(file);
      var downlodeURL=await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl=downlodeURL;
      });
     Map<String, dynamic> map = Map();
    if (fileName != null) {
      String url = downlodeURL;
      map['imageUrl'] = url;
    }
  var uplod=  await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(map);
         
         Get.snackbar("Profile Image", "Your profile image is update");
      }else{
        print("No Image Path Recived");
      }
    }else{
      print("Permission not granted. Try Again with permission access");
    }
  }

}