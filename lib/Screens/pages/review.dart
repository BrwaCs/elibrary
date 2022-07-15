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
          leading: Icon(
            Icons.menu,
            color:Theme.of(context).primaryColor,
          ),
         
      actions: <Widget>[
       Padding(
      padding: EdgeInsets.only(right: 18),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.person,
          size: 26.0,
          color:Theme.of(context).primaryColor,
        ),
      )
    ),
    ],
    // black line of the bottom AppBar
bottom: PreferredSize(
      child: Container(
         color: Colors.black,
         height: 1.0,
      ),
      preferredSize: Size.fromHeight(1.5)
      ),
      ),
      body: Center(
        child: Text("Review Screen",
        style: TextStyle(
          fontSize:24,
          fontWeight: FontWeight.bold
        )
        ),
      )
    );
  }
}