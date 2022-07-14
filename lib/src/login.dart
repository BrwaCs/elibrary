import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatelessWidget {
  final Function togScreen;
  const Login({Key? key, required this.togScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(15),
                      ),
                    prefixIcon:Icon(Icons.phone),
                    labelText: "Phone number",
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
                      onPressed: (){},
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
                
              onPressed: (){},
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
                         onTap:() => togScreen(),
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
}