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
        title: Text("Auther")
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