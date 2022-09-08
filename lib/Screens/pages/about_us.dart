import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("About Us ",
              style: TextStyle(
                 fontFamily: "english",
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),
          centerTitle: true,
      
          // black line of the bottom AppBar
          bottom: PreferredSize(
              // ignore: sort_child_properties_last
              child: Container(
                color: Colors.black,
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.5)),
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        ),
      body: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 130,
                width: 130,
                decoration:BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2
                  ),borderRadius: BorderRadius.circular(75)
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipRRect(
                    child: Image.asset("assets/images/myProfile.jpg"),
                    borderRadius: BorderRadius.circular(75.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Brwa N Muhammad",
              
              style: TextStyle(
                 fontFamily: "english",
                fontSize: 20,fontWeight: FontWeight.w400
              ),)
            ],
          ),
          SizedBox(height: 20,),
           Row( 
                mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>[ 
                  Container( width: 19.0, ),
                   Flexible( 
                     child:Text("my name is Brwa Nahman Muhammad and I  live in chamchamal and I am 21 years old and Student in Halabja university at Computer science department and  also I am created this first Application for educational purpose and I wish that is usefull for all people.",
                     style: TextStyle(
                        fontFamily: "english",
                      fontSize: 16,
                      height: 1.7,
                      wordSpacing: 1.1
                     )
                     ),
                   )
                ]
                   ) 
                   
                   
   
        ],
      )
    );
  }
}
