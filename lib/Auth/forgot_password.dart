import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// firebaseAythExseption

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key,  }) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
late String _email;

final auth=FirebaseAuth.instance;
AuthenticationService firebaseauth= AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //when you unpress textfild that is deactive 
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                     icon:Icon(
                       Icons.arrow_back,
                       size:30,
                       color:Theme.of(context).primaryColor,
                     ),
                     
                     )
              
                  ],
                ),
                SizedBox(height:10),
                Text(
                  "Reset your password ",
                  style: TextStyle(
                    fontSize:24,
                    fontWeight:FontWeight.bold,
                    color:Theme.of(context).primaryColor,
              
                  )
              
                ),
                SizedBox(height:15),
                Text(
                  "Did you forgot your password?",
                  style: TextStyle(
                    fontSize:14,
                    fontWeight: FontWeight.normal,
                    color:Colors.grey,
              
                  )
                ),
                SizedBox(height:30),
                Container(
                  height:50,
                  child: TextFormField(
                     validator: (value) {
                     if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                       }
                        // reg expression for email validation
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return ("Please Enter a valid email");
                            }
                              return null;
                          },
                    onChanged: (value){
                    setState(() {
                      _email=value.trim();
                    });
                    },
                    decoration:InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15)
                      ),
                      prefixIcon:Icon(Icons.email),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.normal,
                      )
                    )
                  ),
                ),
                SizedBox(height:25),
                SizedBox(
                  height:42,
                  width:210,
                  child: FlatButton(
                    color:Theme.of(context).primaryColor,
                    shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                    onPressed: ()async{
           
      final _status = await firebaseauth.resetPassword(
          email: _email.trim());
      if (_status == AuthStatus.successful) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Request is send")),);
      } else {
      
        final error = AuthExceptionHandler.generateErrorMessage(_status);
       ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("email not valid")),);
      }
                    },
                     child: Text(
                       "Send Request",
                       style: TextStyle(
                         fontSize:16,
                         fontWeight: FontWeight.bold,
                         color:Colors.white,
                       )
                       ),
                     ),
                  
                  ),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                                onTap: ()async{
           
      final _status = await firebaseauth.resetPassword(
          email: _email.trim());
      if (_status == AuthStatus.successful) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Request is send")),);
      } else {
      
        final error = AuthExceptionHandler.generateErrorMessage(_status);
       ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("email not valid")),);
      }
                    },
                        child: Text(
                          "didnt recive the code?",
                          style: TextStyle(
                            fontSize:16,
                            fontWeight:FontWeight.w400,
                            color:Theme.of(context).primaryColor,
                          )
                        ),
                      ),
                    ],
          
                  ),
              
              ],
            ),
        ),
        ),
      )
    
    );
    
  }

}