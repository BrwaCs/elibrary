class UserModel {
  String? uid;
  String? email;
  String? fullName;
// why wen we create data model by data class genarater the profile name always null after relod?

  UserModel({this.uid, this.email, this.fullName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['firstName'],
   
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': fullName,
    
    };
  }
}