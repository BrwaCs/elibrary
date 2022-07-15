import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category")
      ),
      body: Center(
        child: Text(
          "Category Screen",
          style: TextStyle(
            fontSize:40,
            fontWeight:FontWeight.bold),
           ),
      )
    );
  }
}