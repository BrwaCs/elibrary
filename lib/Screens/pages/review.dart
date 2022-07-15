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
        title: Text("Rivew")
      ),
      body: Center(
        child: Text(
          "Review Screen",
          style: TextStyle(
            fontSize:40,
            fontWeight:FontWeight.bold),
           ),
      )
    );
  }
}