
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elibrary/Screens/pages/show_books.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';


// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);

//   @override
//   State<test> createState() => _testState();
// }

// class _testState extends State<test> {
//   String name = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//       title: Card(
//           child: TextField(
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search), hintText: 'Search...'),
//             onChanged: (val) {
//               setState(() {
//                 name = val;
//               });
//             },
//           ),
//         )
//         ),
//         body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('books').snapshots(),
//           builder: (context, snapshots) {
//             return (snapshots.connectionState == ConnectionState.waiting)
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                         ),
//                     itemCount: snapshots.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       var data = snapshots.data!.docs[index].data()
//                           as Map<String, dynamic>;

//                       if (name.isEmpty) {
//                         return  SingleChildScrollView(
//                           child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: GestureDetector(
                                
//                                 onTap: () {
//                                   // Navigator.of(context).push(MaterialPageRoute(
//                                   //     builder: (context) => ShowBooks(
//                                   //           authername: books[index].auther,
//                                   //           bookname: books[index].bookName,
//                                   //           image: books[index].bookImage,
//                                   //           description: books[index]
//                                   //               .bookDescription
//                                   //               .toString(),
//                                   //           PdfFile: books[index].file,
//                                   //         )));
//                                 },
//                                 child: Row(
//                                  children: [
//                                    Container(
//                                      height: 180,
//                                      width: 100,
//                                      child: Column(
//                                        children: [
//                                          Expanded(
//                                            child: Row(
//                                              children: [
//                                                Container(
//                                                    height: 133,
//                                                    width: 81,
//                                                    child: FittedBox(
//                                                      child: Image.network(
//                                                          data['bookImage'].toString()),
//                                                      fit: BoxFit.fill,
//                                                    ))
//                                              ],
//                                            ),
//                                          ),
//                                          SizedBox(height: 10),
//                                          Row(
//                                            children: [
//                                              Text(data['bookName'].toString()),
//                                            ],
//                                          )
//                                        ],
//                                      ),
//                                    ),
//                                  ],
//                                   ),
//                               ),
//                             ),
//                         );
//                       }
//                       if (data['bookName']
//                           .toString()
//                           .toLowerCase()
//                           .startsWith(name.toLowerCase())) {
                        
//                         return  SingleChildScrollView(
//                           child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   // Navigator.of(context).push(MaterialPageRoute(
//                                   //     builder: (context) => ShowBooks(
//                                   //           authername: books[index].auther,
//                                   //           bookname: books[index].bookName,
//                                   //           image: books[index].bookImage,
//                                   //           description: books[index]
//                                   //               .bookDescription
//                                   //               .toString(),
//                                   //           PdfFile: books[index].file,
//                                   //         )));
//                                 },
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       height: 180,
//                                       width: 100,
//                                       child: Column(
//                                         children: [
//                                           Expanded(
//                                             child: Row(
//                                               children: [
//                                                 Container(
//                                                     height: 133,
//                                                     width: 81,
//                                                     child: FittedBox(
//                                                       child: Image.network(
//                                                           data['bookImage'].toString()),
//                                                       fit: BoxFit.fill,
//                                                     ))
//                                               ],
//                                             ),
//                                           ),
//                                           SizedBox(height: 10),
//                                           Row(
//                                             children: [
//                                               Text(data['bookName'].toString()),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                         );
//                       }
//                       return Container();
//                     });
//           },
//         )
//         );
//   }
// }