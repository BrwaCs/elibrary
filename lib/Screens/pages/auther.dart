import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Auther extends StatefulWidget {
  const Auther({Key? key}) : super(key: key);

  @override
  State<Auther> createState() => _AutherState();
}

class _AutherState extends State<Auther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Author ",
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
    ]
  
      ),
      body: Center(
        child: Text(
          "Auther Screen",
          style: TextStyle(
            fontSize:40,
            fontWeight:FontWeight.bold),
           ),
      )
    );
  }
}