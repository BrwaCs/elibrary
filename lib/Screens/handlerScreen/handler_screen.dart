import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Auth/auth.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/Provider/user_provider.dart';
import 'package:elibrary/Screens/mainpages.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class HandlerScreen extends StatelessWidget {
  const HandlerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth=FirebaseAuth.instance;
    return Scaffold(
       body: StreamBuilder(
         stream: auth.authStateChanges(),
         builder: (context,snapshot){
           if(snapshot.connectionState==ConnectionState.waiting){
             return LoadingIndicator();
           }
           else if (snapshot.data == null){
             return Auth();
           }
           else if(snapshot.hasError){
             return Center(child: Text("error"),);
           }

          //  return mainpages();
          return  FutureBuilder<UserModel> (
              future: getUser(snapshot.data! as User,context),
              builder: (context, snapshotFromFuture) {
                if (snapshotFromFuture.connectionState ==
                    ConnectionState.waiting) {
                  return LoadingIndicator();
                } else if (snapshotFromFuture.hasError) {
                  return Center(
                    child: Text(snapshotFromFuture.error.toString()),
                  );
                } else if (snapshotFromFuture.data == null) {
                  //TODO: get the device token

                  //TODO: save the device token to user/device_tokens

                }
                return mainpages();
              });
         },
       )
    );
  }
   Future<UserModel> getUser(User user,context) async {
    UserModel libraryUser = await FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get()
        .then((value) => UserModel.fromSnapShot(value));

    Provider.of<UserProvider>(context,listen: false).setWeCodeUser(libraryUser);

    return libraryUser;
  }
}