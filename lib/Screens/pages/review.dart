// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:elibrary/Screens/pages/drawar.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/ReviewDataModel.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Review extends StatefulWidget {
   Review({Key? key,  }) : super(key: key);
 
  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Review ",
          style: TextStyle(
            fontSize:24,
            fontWeight:FontWeight.normal,
            color:Colors.black
          )
          ),
          centerTitle: true,    
      actions: <Widget>[
       Padding(
      padding: EdgeInsets.only(right: 18),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
        },
        child: Icon(
          IconData(0xee35, fontFamily: 'MaterialIcons'),
          size: 26.0,   
        ),
      )
    ),
    ],
    // black line of the bottom AppBar
bottom: PreferredSize(
      // ignore: sort_child_properties_last
      child: Container(
         color: Colors.black,
         height: 1.0,
      ),
      preferredSize: Size.fromHeight(1.5)
      ),
      iconTheme: IconThemeData(color:Theme.of(context).primaryColor),
      ),
    drawer: Drawar(),
 body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance.collection("Review").get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text("Error..."));
              } else if (snapshot.data == null) {
                return Center(child: Text("Data is null"));
              }
// create a liat of book models from fire store  query snapshot
              List<ReviewDataModel> Review_model = snapshot.data!.docs
                  .map((e) => ReviewDataModel.fromMap(e.data()))
                  .toList();
              
  return   ListView.builder(
   
                     itemCount: Review_model.length,
                    itemBuilder: (context, index) {
    return Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    height: 170,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: Color.fromARGB(255, 235, 235,235),
                    ), 
                    child: Column(
                      children: [
                        Row(
                          children: [
                           Flexible( 
                          fit: FlexFit.tight,
                             child: Container(
                               height: 35,
                               width: 320,
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: GestureDetector(
                                     onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                                               },
                                  child: Icon(
                                  IconData(0xee35, fontFamily: 'MaterialIcons'),
                                  size: 26.0,   
                                     ),
                                     ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(top:10),
                                     child: Text("Name",
                                     style: TextStyle(
                                       fontSize: 14,fontWeight: FontWeight.normal
                                     ),),
                                   ),
   
   
                                 ],
                               ),
                             )
                             )
                          ],
                        ),
                        Divider(
                          thickness: 0.8,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           Flexible( 
                          fit: FlexFit.tight,
                             child: Container(
   
                               height: 66,
                               width: 320,
                               child: Row( 
                                mainAxisAlignment:MainAxisAlignment.spaceAround,
                                children: <Widget>[ 
                                // Container( width: 14.0, ),
                               Flexible( 
                              child: Text("${Review_model[index].review}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                            fontSize: 14,
                           height: 1.25
                     )
                     ),
                   ) 
                   ], 
                   ), 
                             )
                             )
                          ],
                        ),
                         Divider(
                          thickness: 0.8,
                          color: Colors.black,
                        ),
                        Row(
                          
                          children: [
                           Flexible( 
                          fit: FlexFit.tight,
                             child: Container(
                             
                               height: 35,
                               width: 320,
                               child: Center(
                                 child: Text("${Review_model[index].bookName}", 
                                 style: 
                                 TextStyle(
                                   fontSize: 16,
                                   fontWeight: FontWeight.normal,
                                 ),),
                               ),
                             )
                             )
                          ],
                        ),
                      ],
                    )
                    ),
                  ),
                ),
              
        
            ]
            
          );
                    }
  );
 
            }
 )
    );
  }
}