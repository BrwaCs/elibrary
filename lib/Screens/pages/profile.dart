
// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

// when we login user name in profile is null after hot relod in display name why ?

class _ProfileState extends State<Profile> {

  
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
String? imageUrl;
//   final ImagePicker _picker= ImagePicker();
// XFile? _selectImage;
  @override
  Widget build(BuildContext context) {
    //future biulder
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Profile ",
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
                      onPressed: (){},
                              child: Text("Edit",
                              style: TextStyle(
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
                
                child: imageUrl==null ?
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
                
              //    Container( child:CircleAvatar(
              //    backgroundColor: Colors.transparent,
              //    radius: 60,
              //     backgroundImage:
              //     NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjC0aAIzmF7cePLylt4ObVinrZRkqGn-4Gv3fHf7J4fQHyppZp_MZ8HQm2KtQCPvfWIyQ&usqp=CAU'),
                
              //  ))
               :Stack(
                 children: [
                     Container(
                    height: 108,
                    width: 100,
                    child:CircleAvatar(
                   backgroundColor: Colors.transparent,
                   radius: 60,
                    backgroundImage:
                    NetworkImage(imageUrl!)
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
                  fontSize:18,
                  fontWeight: FontWeight.w500
      
                ),
              )
            ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text(
                  "Reviews 10",
                  style: TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.bold
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
                    fontSize:16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8,),
            Row( 
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: <Widget>[ 
                Container( width: 14.0, ),
                 Flexible( 
                   child: Text("Sit veniam excepteur et commodo consequat velitsdihfioshe reprehenderit reprehenderit veniam voluptate incididunt magna culpa.Cillum duis enim pariatur adipisicing qui do non sint culpa.",
                   style: TextStyle(
                    fontSize: 14,
                    height: 1.25
                   )
                   ),
                 ) 
                 ], 
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
Future<void>logout(BuildContext context)async{

await FirebaseAuth.instance.signOut();

Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));

}




uploadImage() async {

    final _firebaseStorage = FirebaseStorage.instance;
    final _imagePicker = ImagePicker();
    XFile image;
    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //select images

      XFile? image=await _imagePicker.pickImage(source: ImageSource.gallery);
      var file=File(image!.path);
      final fileName = basename(file.path);
      if(image !=null){
      //upload image to firebase
      var snapshot=await _firebaseStorage.ref()
      .child('images/$fileName').putFile(file);
      var downlodeURL=await snapshot.ref.getDownloadURL();
      setState(() {
        imageUrl=downlodeURL;
      });
      
      }else{
        print("No Image Path Recived");
      }
    }else{
      print("Permission not granted. Try Again with permission access");
    }
  }
}