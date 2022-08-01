

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/mainpages.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {

  final Function togScreen;
   Register({Key? key, required this.togScreen}) : super(key: key);
     String? errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();
final _auth=FirebaseAuth.instance;
TextEditingController _emailController= TextEditingController();
TextEditingController _nameController=TextEditingController();
TextEditingController _passwordController= TextEditingController();
TextEditingController _repasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {

final emailfield= Container(
                      height:50,
                    child: TextFormField( 
                      controller: _emailController,  
                      decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        ),
                      prefixIcon:Icon(Icons.email),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.normal,
                        
                        
                      )
                    
                      ),
          
                    ),
          
                  );
    final namefield= Container(
                      height:50,
                    child: TextFormField( 
                      controller: _nameController,  
                      decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        ),
                      prefixIcon:Icon(Icons.person),
                      labelText: "Full name",
                      labelStyle: TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.normal,
                        
                        
                      )
                    
                      ),
          
                    ),
          
                  );
    final passswordfild=       Container(
                      height:50,
                    child: TextFormField( 
                      obscureText: true,
                      controller: _passwordController,  
                      decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        ),
                      prefixIcon:Icon(Icons.vpn_key),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.normal,
                        
                        
                      )
                    
                      ),
          
                    ),
          
                  );
    final repasswordfild=Container(
                      height:50,
                    child: TextFormField( 
                      obscureText: true,  
                      controller: _repasswordController,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),
                        ),
                      prefixIcon:Icon(Icons.vpn_key),
                      labelText: "Re-Password",
                      labelStyle: TextStyle(
                        fontSize:20,
                        fontWeight: FontWeight.normal,
                        
                        
                      )
                    
                      ),
          
                    ),
          
                  );
    final createbutton=   SizedBox(
                   height:42,
                   width:210,
                   child: FlatButton(
                     color:Theme.of(context).primaryColor,
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  
                onPressed: (){
                 Signup(_emailController.text, _passwordController.text,dynamic);
                },
                child: Text(
                  "Create",
                  style:TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.bold,
                    color:Colors.white,
    
                  )
                ),
              ),
                 );

    final haveAccountTextButt0n=Row(
                   mainAxisAlignment:MainAxisAlignment.center,
                   children: [
                     Text(
                       "Alredy have a account",
                       style:TextStyle(
                         fontSize:16,
                         fontWeight: FontWeight.normal,
                         color:Colors.grey,
                       )
                       ),
                        GestureDetector(
                           onTap: ()=>togScreen(),
                           child: Text(
                          " Login",
                           style:TextStyle(
                           fontSize:16,
                           fontWeight: FontWeight.bold,
                           color:Theme.of(context).primaryColor,
                           )
                          ),
                       ),
                   ],
                 );

    
    return GestureDetector(
      onTap:() =>FocusScope.of(context).unfocus(), 
      child: Scaffold(
        body:Padding(padding: EdgeInsets.all(20),
        child:Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon:Icon(Icons.arrow_back,
                       size:30,
                       color:Theme.of(context).primaryColor,
                      ), onPressed: () =>togScreen(),
                     
                    )
                  ],
                ),
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize:32,
                    fontWeight: FontWeight.w400,
                    color:Colors.blue,
                    
                  ),
                  ),
                 
                  SizedBox(height:50),
                 emailfield,
                  SizedBox(height:30),
                  namefield,
                  SizedBox(height:30),
             passswordfild,
                   SizedBox(height:30),
                repasswordfild,
                 SizedBox(height:35),
              createbutton,
                 SizedBox(height:30),
                 haveAccountTextButt0n
              ],
            ),
          ),
        )
       ),
      ),
    );
  }

 


void Signup(String email,String password,Context)async{
  await _auth.createUserWithEmailAndPassword(email: email, password: password)
  .then((value) => {postDetailForFireStore(Context)})
  .catchError((e){
     Fluttertoast.showToast(msg: e!.message);
     });
}
postDetailForFireStore(Context)async{
  FirebaseFirestore firebasefirestore= FirebaseFirestore.instance;

User? user=_auth.currentUser;
UserModel usermodel=UserModel();

usermodel.email=user!.email;
usermodel.uid=user.uid;
usermodel.fullName=_nameController.text;

await firebasefirestore.collection("user").doc(user.uid).set(usermodel.toMap());
Fluttertoast.showToast(msg: "Account created successfully");

Navigator.pushAndRemoveUntil(
  (Context), MaterialPageRoute(
    builder: (context)=> Login(togScreen: togScreen,)),
   (route) => false);
}

}