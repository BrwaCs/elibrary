import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elibrary/Screens/pages/show_books.dart';
import 'package:elibrary/Screens/widgets/Loding_indicater.dart';
import 'package:elibrary/dataModels/Catygory_datamodel.dart';
import 'package:elibrary/dataModels/books_authers_datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ShowCatyegorybooks extends StatelessWidget {
  ShowCatyegorybooks({Key? key, required this.catygory}) : super(key: key);
  final CatygoryDataModel catygory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("${catygory.category} books",
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
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("books")
                .where("category", isEqualTo: catygory.category)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndicator();
              } else if (snapshot.hasError) {
                return Center(child: Text("Error..."));
              } else if (snapshot.data == null) {
                return Center(child: Text("Data is null"));
              }
// create a liat of book models from fire store  query snapshot
              List<BookModel> catygoryBooks = snapshot.data!.docs
                  .map((e) => BookModel.fromSnapShot(e))
                  .toList();

              return catygoryBooks.isNotEmpty? ListView.builder(

                  // scrollDirection: Axis.horizontal,
                  itemCount: catygoryBooks.length,
                  itemBuilder: ((context, index) {
                    return  GestureDetector(
                     onTap: (){
                       Get.to(()=>ShowBooks(
                                          authername:  catygoryBooks[index].auther,
                                          bookname:  catygoryBooks[index].bookName,
                                          image:  catygoryBooks[index].bookImage,
                                          description:  catygoryBooks[index]
                                              .bookDescription
                                              .toString(),
                                          PdfFile:  catygoryBooks[index].file,
                                          
                                        ));
                     },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0.0, top: 47),
                                child: Container(
                                  height: 124,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10), // radius of 10
                    
                                    color: Color.fromARGB(255, 217, 217, 217), // green as background color
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:80.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${catygoryBooks[index].bookName}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${catygoryBooks[index].auther}",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0.0, top: 20),
                                  child: Container(
                                    height: 180,
                                    width: 111,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(255, 217, 217, 217),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                catygoryBooks[index].bookImage))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                
                  })
                  )
                      : SafeArea(child: Center(child: Text("No books found ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      )));
            }));
  }
}
