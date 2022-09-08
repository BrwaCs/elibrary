import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Screens/pages/drawar.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/Screens/pages/show_books.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/books_authers_datamodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool mod = true;
  TextEditingController searchController = new TextEditingController();
  String? searchquery;

  Future<List<BookModel>> searchFromFirebase(String? query) async {
    if (query == null) {
      final finalresult =
          await FirebaseFirestore.instance.collection('books').get();
      return finalresult.docs
          .map(
            (e) => BookModel.fromSnapShot(e),
          )
          .toList();
    } else {
      final result = await FirebaseFirestore.instance
          .collection('books')
          .where('bookName', isGreaterThanOrEqualTo: query)
          .get();
      return result.docs
          .map(
            (e) => BookModel.fromSnapShot(e),
          )
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Home ",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),
          centerTitle: true,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 18),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Icon(
                    IconData(0xee35, fontFamily: 'MaterialIcons'),
                    size: 26.0,
                  ),
                )),
          ],
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
        drawer: Drawar(),
        body: FutureBuilder<List<BookModel>>(
          future: searchFromFirebase(searchquery),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingIndicator();
            } else if (snapshot.data == null) {
              return Center(
                child: Text("data is null"),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("error"),
              );
            }
            print(snapshot.data!.length);
            return ListView(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 302,
                    child: TextField(
                        controller: searchController,
                        autocorrect: true,
                        onChanged: (value) {
                          if (value == "") {
                            setState(() {
                              searchquery = null;
                            });
                          }
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  searchController.clear();
                                  searchquery = null;
                                });
                              },
                              icon: const Icon(Icons.clear),
                            ),
                            prefixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  searchquery = searchController.text;
                                });
                              },
                              icon: const Icon(Icons.search),
                            ),
                            labelText: "search for books",
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Books",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Container(
                height: 2000,
                width: double.infinity,
        
                child: Center(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                         
                        crossAxisCount: 2,
                      ),
                      // scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ShowBooks(
                                        authername: snapshot.data![index].auther,
                                        bookname: snapshot.data![index].bookName,
                                        image: snapshot.data![index].bookImage,
                                        description: snapshot
                                            .data![index].bookDescription
                                            .toString(),
                                        PdfFile: snapshot.data![index].file,
                                      )));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 180,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                                height: 133,
                                                width: 81,
                                                child: FittedBox(
                                                  child: Image.network(snapshot
                                                      .data![index].bookImage),
                                                  fit: BoxFit.fill,
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                       
                                        children: [
                                          Text(snapshot.data![index].bookName)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ),
            ]);
          },
        ));
  }
}
