import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home")
      ),
      body: Center(
        child: Text(
          "Home Screen",
          style: TextStyle(
            fontSize:40,
            fontWeight:FontWeight.bold),
           ),
      )
    );
    
  }
}