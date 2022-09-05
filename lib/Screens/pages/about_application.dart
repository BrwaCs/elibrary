import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class About_Application extends StatelessWidget {
  const About_Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("About Application ",
              style: TextStyle(
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
      body: Container(),
    );
    
  }
}