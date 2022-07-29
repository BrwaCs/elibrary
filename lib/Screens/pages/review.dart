// ignore_for_file: prefer_const_constructors
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

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
        drawer: Drawer(
          
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height:155,
              child: UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/originals/dd/64/da/dd64da585bc57cb05e5fd4d8ce873f57.png"),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/library.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
        ),
            ),
            ListTile(
              leading: Icon(Icons.book,
              color: Theme.of(context).primaryColor,
              ),
              title: Text("New books",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star,
              color: Theme.of(context).primaryColor,),
              title: Text("Rating the app",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.report,
              color: Theme.of(context).primaryColor,),
              title: Text("About the application",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_box,
              color: Theme.of(context).primaryColor,),
              title: Text("About us",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),),
              onTap: () {},
            )
          ]
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                       Flexible( 
                      fit: FlexFit.tight,
                         child: Container(

                           height: 66,
                           width: 320,
                           child: Row( 
                            mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: <Widget>[ 
                            Container( width: 14.0, ),
                           Flexible( 
                          child: Text("Sit veniam excepteur et commodo consequat velitsdihfioshe reprehenderit reprehenderit veniam voluptate incididunt magna culpa.",
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
                      thickness: 0.5,
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
                             child: Text("book name", 
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
      )
    
    );
  }
}