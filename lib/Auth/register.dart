import 'package:elibrary/Screens/mainpages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatelessWidget {

  final Function togScreen;
   Register({Key? key, required this.togScreen}) : super(key: key);
TextEditingController _emailController= TextEditingController();
TextEditingController _nameController=TextEditingController();
TextEditingController _passwordController= TextEditingController();
TextEditingController _repasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  Container(
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
          
                  ),
                  SizedBox(height:30),
                   Container(
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
          
                  ),
                  SizedBox(height:30),
                    Container(
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
          
                  ),
                   SizedBox(height:30),
                    Container(
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
          
                  ),
                
          
                 SizedBox(height:35),
                 SizedBox(
                   height:42,
                   width:210,
                   child: FlatButton(
                     color:Theme.of(context).primaryColor,
                   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => mainpages()));
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
                 ),
                 SizedBox(height:30),
                 Row(
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
                 ),
              ],
            ),
          ),
        )
       ),
      ),
    );
  }

 
}