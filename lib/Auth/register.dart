import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Screens/mainpages.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {

  
   Register({Key? key,}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                      autofocus: false,
                      textInputAction: TextInputAction.next,
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
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                    RegExp regex = new RegExp(r'^.{5,}$');
                    if (value!.isEmpty) {
                   return ("Name cannot be Empty");
                     }
                   if (!regex.hasMatch(value)) {
                  return ("Enter Valid name(Min. 5 Character)");
                   }
                   return null;
                      },
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
    final passswordfild= Container(
                      height:50,
                    child: TextFormField( 
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                     RegExp regex = new RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
                     if (value!.isEmpty) {
                     return ("Password is required for login");
                       }
                     if (!regex.hasMatch(value)) {
                      return ("Password should contain Capital, small letter & Number & Special");
                       }
                       },
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
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                    if (_repasswordController.text !=
                          _passwordController.text) {
                         return "Password don't match";
                           }
                         return null;
                         },
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
                 Signup(_emailController.text.trim(), _passwordController.text,dynamic);
                 postDetailForFireStore();
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
                           onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon:Icon(Icons.arrow_back,
                         size:30,
                         color:Theme.of(context).primaryColor,
                        ), onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())),
                       
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
          ),
        )
       ),
      ),
    );
  }

void Signup(String email,String password,Context)async{
  if(_formKey.currentState!.validate()){

    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
  .then((value) => {postDetailForFireStore()})
  .catchError((e){
     Fluttertoast.showToast(msg: e!.message);
     });

    } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
  }
  
}
}

postDetailForFireStore()async{
  FirebaseFirestore firebasefirestore= FirebaseFirestore.instance;

User? user=_auth.currentUser;
UserModel usermodel=UserModel();

usermodel.email=user!.email;
usermodel.uid=user.uid;
usermodel.fullName=_nameController.text;

await firebasefirestore.collection("user").doc(user.uid).set(usermodel.toMap());
Fluttertoast.showToast(msg: "Account created successfully");

Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => mainpages()),
        (route) => false);
}
}










