import 'package:auto_size_text/auto_size_text.dart';
import 'package:elibrary/Screens/pages/Downloade_file.dart';
import 'package:elibrary/Screens/pages/PDF_Viewr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAutherDetails extends StatelessWidget {
  ShowAutherDetails(
      {Key? key,
      required this.authername,
      required this.autherImage,
      required this.autherDescription})
      : super(key: key);

  final String authername;
  final String autherImage;
  final String autherDescription;

  final Downloadefile = Downloade();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(authername,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.fill,
      image: NetworkImage(autherImage),
    ),
  ),
         
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18, top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    authername,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ],
              ),
            ),
               Padding(
              padding: const EdgeInsets.only(
                  left: 24.0,  top: 15, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                   " About ${authername} :",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: "english",),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 330,
                    height:  MediaQuery.of(context).size.height,
                    child: AutoSizeText(
                      autherDescription,
                      style: TextStyle(fontSize: 14, height: 1.6, fontFamily: "english",),
                      textAlign: TextAlign.center,
                      maxLines: 5000,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
