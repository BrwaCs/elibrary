import 'package:elibrary/Auth/forgot_password.dart';
import 'package:elibrary/Auth/register.dart';
import 'package:elibrary/Screens/mainpages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login extends StatefulWidget {
  
  
  Login({Key? key, }) : super(key: key);

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


 // password strength check
RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0; 
 bool validatePassword(String pass){
    String _password = pass.trim();
    if(_password.isEmpty){
      setState(() {
        password_strength = 0;
      });
    }else if(_password.length < 6 ){
      setState(() {
        password_strength = 1 / 4;
      });
    }else if(_password.length < 8){
      setState(() {
        password_strength = 2 / 4;
      });
    }else{
      if(pass_valid.hasMatch(_password)){
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      }else{
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }



  @override
  Widget build(BuildContext context) {
  final emailFild= Container(
                      height:50,
                    child: TextFormField(  
                      validator: (value) {
                     if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                       }
                        // reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                    return ("Please Enter a valid email");
                            }
                              return null;
                          },
                       keyboardType: TextInputType.emailAddress,
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
                  
                  );
final passwordFild= Container(
                      height:50,
                    child: TextFormField( 
                      onChanged: (value){
                    _formKey.currentState!.validate();
                  },
                     validator: (value){
                      if(value!.isEmpty){
                        return "Please enter password";
                      }else{
                       //call function to check password
                        bool result = validatePassword(value);
                        if(result){
                          // create account event
                         return null;
                        }else{
                          return "Password should contain Capital & small letter & Number & Special";
                        }
                      }
                  },
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
                  
                  );
final loginButton=  SizedBox(
                   height:42,
                   width:210,
                   child: FlatButton(
                     color:Theme.of(context).primaryColor,
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  
                onPressed: () async {password_strength != 1 ? null : (){
                
              
                  debugPrint("username: ${_emailController.text}");
                            debugPrint("password: ${_passwordController.text}");
          
                       signIn(_emailController.text, _passwordController.text);
                           };     
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
                 );
return Scaffold(

      body:Padding(padding: EdgeInsets.all(25),

      child:Center(

        child: SingleChildScrollView(

          child: Form(

            key:_formKey,

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

                 emailFild,

                  SizedBox(height:30),

                   passwordFild,

                    Padding(

                padding: const EdgeInsets.all(12.0),

                child: LinearProgressIndicator(

                  value: password_strength,

                  backgroundColor: Colors.grey[300],

                  minHeight: 5,

                  color: password_strength <= 1 / 4

                      ? Colors.red

                      : password_strength == 2 / 4

                      ? Colors.yellow

                      : password_strength == 3 / 4

                      ? Colors.blue

                      : Colors.green,

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

                 loginButton,

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

                           onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=>Register())),

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

        ),

      )

     ),

    );   
 }

  void signIn(String email, String password) async{
    if(_formKey.currentState!.validate()){
      try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
        Fluttertoast.showToast(msg: "Login successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>mainpages()))
      });
      }on FirebaseAuthException catch(error) {
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
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }

    }

  }

}





























// 