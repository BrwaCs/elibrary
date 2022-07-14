import 'package:elibrary/src/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class forgot_password extends StatelessWidget {
  const forgot_password({Key? key,  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //when you unpress textfild that is deactive 
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          // add singlechildscrollview     but have some problem 
          child:  Column(
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
                    decoration:InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15)
                      ),
                      prefixIcon:Icon(Icons.phone),
                      labelText: "Phone number",
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
                    onPressed: (){},
                     child: Text(
                       "Send code",
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
                        onTap: () {},
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