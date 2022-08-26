import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? imageUrl;
  DocumentReference? reference;
// why wen we create data model by data class genarater the profile name always null after relod?

  UserModel({this.uid, this.email, this.fullName,this.reference,this.imageUrl});



  factory UserModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>,
        reference: documentSnapshot.reference);
  }
  // receiving data from server
  factory UserModel.fromMap(map, {required DocumentReference<Object?> reference}) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['firstName'],
      imageUrl:map['imageUrl'],
   
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': fullName,
      'imageUrl':imageUrl,
    
    };
  }
}