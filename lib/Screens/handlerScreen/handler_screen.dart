import 'package:elibrary/Auth/auth.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/mainpages.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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

           return mainpages();
         },
       )
    );
  }
}