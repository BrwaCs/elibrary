import 'package:elibrary/Auth/forgot_password.dart';
import 'package:elibrary/Auth/register.dart';
import 'package:elibrary/Screens/mainpages.dart';
import 'package:elibrary/Screens/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login extends StatefulWidget {
  
  final Function togScreen;
  Login({Key? key, required this.togScreen}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // editing controller
final TextEditingController _emailController= new TextEditingController();

final TextEditingController _passwordController= new TextEditingController();

// firebase auth
final _auth=FirebaseAuth.instance;
 
  // string for displaying the error Message
  String? errorMessage;

 final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
       stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loding...")
            );
          } else if (snapshot.hasError) {
            return Text("email or password not correct");
          } else if (snapshot.data == null) {
            return notLoggedIn(context);
          }
          return userisloggedin(snapshot.data!.email!);
        });

      }
  
  
 Widget notLoggedIn(context) {
return Scaffold(
      body:Padding(padding: EdgeInsets.all(25),
      child:Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
         
              Text(
                "Welcome to elibrary",
                style: TextStyle(
                  fontSize:32,
                  fontWeight: FontWeight.w400,
                  color:Colors.blue,
                  
                ),
                ),
                SizedBox(height: 10),
                 Text(
                "sign in to continue",
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.normal,
                  color:Colors.grey,
                  
                ),
                ),
                SizedBox(height:70),
                Container(
                    height:50,
                  child: TextFormField(  
                     keyboardType: TextInputType.emailAddress,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return ("Please Enter Your Email");
        //   }
        //   // reg expression for email validation
        //   if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        //       .hasMatch(value)) {
        //     return ("Please Enter a valid email");
        //   }
        //   return null;
        // },
        onSaved: (value) {
          _emailController.text = value!;
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
        
                ),
                SizedBox(height:30),
                  Container(
                    height:50,
                  child: TextFormField( 
        //             validator: (value) {
        //   RegExp regex = new RegExp(r'^.{6,}$');
        //   if (value!.isEmpty) {
        //     return ("Password is required for login");
        //   }
        //   if (!regex.hasMatch(value)) {
        //     return ("Enter Valid Password(Min. 6 Character)");
        //   }
        // },
        onSaved: (value) {
          _passwordController.text = value!;
        },
                     controller: _passwordController,
                    obscureText: true, 
                    decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15),
                      ),
                    prefixIcon:Icon(Icons.lock),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.normal,
                      
                      
                    )
                  
                    ),
        
                  ),
        
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton( 
                      onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => forgot_password()));
          },
                       child: Text(
                         "Forgot Password?",
                         style: TextStyle(
                           fontSize:14,
                           fontWeight: FontWeight.w500,
                           color:Theme.of(context).primaryColor,
                         ),
                         )
                       
                       
                       )
                  ],
                ),
        
               SizedBox(height:20),
               SizedBox(
                 height:42,
                 width:210,
                 child: FlatButton(
                   color:Theme.of(context).primaryColor,
                 shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                
              onPressed: () async {

                debugPrint("username: ${_emailController.text}");
                          debugPrint("password: ${_passwordController.text}");

                          await loginWithUserAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) => print(value.user!.email));
                              
              },
              child: Text(
                "Login",
                style:TextStyle(
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
                   Text(
                     "Dont have account?\n",
                     style:TextStyle(
                       fontSize:16,
                       fontWeight: FontWeight.normal,
                       color:Colors.grey,
                     )
                     ),

                 ],

               ),
               Row(
                 mainAxisAlignment:MainAxisAlignment.center,
                 children: [
                       GestureDetector(
                         onTap:() => widget.togScreen(),
                         child: Text(
                         "Create new account",
                         style:TextStyle(
                         fontSize:16,
                         fontWeight: FontWeight.bold,
                         color:Theme.of(context).primaryColor,
                                            )
                                            ),
                       ),
                 ],
               )
            ],
            
          ),
        ),
      )
     ),

    );
  
   
 }
  
  Widget userisloggedin(String email){
return Center(
  child:   Scaffold(
  
    body: Column(
  
      children: [
  
        
  
        
  
        ElevatedButton(onPressed: (){
  
          FirebaseAuth.instance.signOut();
  
        }, child: Text("signout"))
  
      ],
  
    ),
  
  ),
);
  }
  }
  
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   // form key
//   final _formKey = GlobalKey<FormState>();

//   // editing controller
//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();

//   // firebase
//   final _auth = FirebaseAuth.instance;
  
//   // string for displaying the error Message
//   String? errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     //email field
//     final emailField = TextFormField(
//         autofocus: false,
//         controller: emailController,
//         keyboardType: TextInputType.emailAddress,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return ("Please Enter Your Email");
//           }
//           // reg expression for email validation
//           if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//               .hasMatch(value)) {
//             return ("Please Enter a valid email");
//           }
//           return null;
//         },
//         onSaved: (value) {
//           emailController.text = value!;
//         },
//         textInputAction: TextInputAction.next,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.mail),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Email",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));

//     //password field
//     final passwordField = TextFormField(
//         autofocus: false,
//         controller: passwordController,
//         obscureText: true,
//         validator: (value) {
//           RegExp regex = new RegExp(r'^.{6,}$');
//           if (value!.isEmpty) {
//             return ("Password is required for login");
//           }
//           if (!regex.hasMatch(value)) {
//             return ("Enter Valid Password(Min. 6 Character)");
//           }
//         },
//         onSaved: (value) {
//           passwordController.text = value!;
//         },
//         textInputAction: TextInputAction.done,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.vpn_key),
//           contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           hintText: "Password",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ));

//     final loginButton = Material(
//       elevation: 5,
//       borderRadius: BorderRadius.circular(30),
//       color: Colors.redAccent,
//       child: MaterialButton(
//           padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//           minWidth: MediaQuery.of(context).size.width,
//           onPressed: () {
//             signIn(emailController.text, passwordController.text);
//           },
//           child: Text(
//             "Login",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//           )),
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(36.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
                   
//                     SizedBox(height: 45),
//                     emailField,
//                     SizedBox(height: 25),
//                     passwordField,
//                     SizedBox(height: 35),
//                     loginButton,
//                     SizedBox(height: 15),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text("Don't have an account? "),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           home()));
//                             },
//                             child: Text(
//                               "SignUp",
//                               style: TextStyle(
//                                   color: Colors.redAccent,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15),
//                             ),
//                           )
//                         ])
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  //  void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate() ) {
  //       await _auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((uid) => {
  //                 Fluttertoast.showToast(msg: "Login Successful"),
  //                 Navigator.of(context).pushReplacement(
  //                     MaterialPageRoute(builder: (context) => home())),
  //               }).catchError((e)
  //               {
  //               Fluttertoast.showToast(msg: e!.message);
  //               });

  //     } 
  //   }
  
  Future<UserCredential> loginWithUserAndPassword(
      {required String email, required String password}) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }


