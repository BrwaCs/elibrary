import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Screens/pages/Downloade_file.dart';
import 'package:elibrary/Screens/pages/PDF_Viewr.dart';
import 'package:elibrary/Screens/pages/review.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/User_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class ShowBooks extends StatefulWidget {
  ShowBooks(
      {Key? key,
      required this.bookname,
      required this.authername,
      required this.image,
      required this.description,
      required this.PdfFile, })
      : super(key: key);
  final String bookname;
  final String authername;
  final String image;
  final String description;
  final String PdfFile;
   
  @override
  State<ShowBooks> createState() => _ShowBooksState();
}

class _ShowBooksState extends State<ShowBooks> {
 

  final Downloadefile = Downloade();
  bool Review = true;
  TextEditingController ReviewController = TextEditingController();


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.bookname,
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
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.bookname,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    widget.authername,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
                    height: 150,
                    child: AutoSizeText(
                      widget.description,
                      style: TextStyle(fontSize: 16, height: 1.25),
                      textAlign: TextAlign.center,
                      maxLines: 9,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Color.fromARGB(255, 30, 212, 0),
                  height: 42,
                  width: 209,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => View(
                              pdfname: widget.bookname,
                              url: widget.PdfFile,
                            ));
                      },
                      child: Text(
                        "Read",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 42,
                  width: 209,
                  child: ElevatedButton(
                      onPressed: () {
                        Downloadefile.downloadFile(
                            link: widget.PdfFile, filename: widget.bookname);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 30, 212, 0),
                        ),
                      ),
                      child: Text(
                        "Downloade",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 34,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 42,
                  width: 209,
                  child: ElevatedButton(
                      onPressed: () {
                        openDialog(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 223, 214, 7),
                        ),
                      ),
                      child: Text(
                        "Review",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Future openDialog(BuildContext context) {
    return showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Review ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            content: TextFormField(
              controller: ReviewController,
              style: TextStyle(
                  wordSpacing: 1.5,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 2),
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 223, 214, 7), width: 1.3),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: "Add Review",
                hintStyle: TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              maxLines: 8,
            ),
            actions: [
              Center(
                child: SizedBox(
                  height: 40,
                  width: 170,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 223, 214, 7),
                        ),
                        side: MaterialStateProperty.all(BorderSide(
                            color: Color.fromARGB(255, 223, 214, 7),
                            width: 1,
                            style: BorderStyle.solid)),
                      ),
                      onPressed: () {
                        addReviewToFireStore();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                ),
              )
            ],
          );
        },
        context: context);
  }

  addReviewToFireStore() async {
      
    setState(() {
      ReviewController.text.isEmpty ? Review = false : Review = true;
    });
    if (Review == true) {
      Map<String, dynamic> map = Map();

      map['review'] = ReviewController.text;
      map['uid'] = FirebaseAuth.instance.currentUser!.uid;
      map['bookName'] = widget.bookname;

      await FirebaseFirestore.instance.collection("Review").doc().set(map);
      ReviewController.clear();
    }
  }
  
}



 