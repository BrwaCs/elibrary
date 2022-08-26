
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

// List<Map<String,dynamic>> autherMock=[{
//   "auther": "William Shakespeare",
//   "autherImage": "http://dummyimage.com/176x100.png/dddddd/000000",
//   "autherDescribtion": "Vipe"
// }, {
//   "auther": "Albert Einstein",
//   "autherImage": "http://dummyimage.com/140x100.png/5fa2dd/ffffff",
//   "autherDescribtion": "Feedfire"
// }, {
//   "auther": "BoFyodor Dostoevskyards",
//   "autherImage": "http://dummyimage.com/137x100.png/5fa2dd/ffffff",
//   "autherDescribtion": "Buzzbean"
// }, {
//   "auther": "danya kukafka",
//   "autherImage": "http://dummyimage.com/192x100.png/cc0000/ffffff",
//   "autherDescribtion": "Kare"
// }, {
//   "auther": "Lizzie Pook",
//   "autherImage": "http://dummyimage.com/152x100.png/5fa2dd/ffffff",
//   "autherDescribtion": "BlogXS"
// }, {
//   "auther": "Janice Hallett",
//   "autherImage": "http://dummyimage.com/139x100.png/cc0000/ffffff",
//   "autherDescribtion": "Gabtune"
// }];




// addData()async{
//   for(var element in autherMock){
//     FirebaseFirestore.instance.collection("Auther").add(element);
//   }
// }

//   @override
// void initState(){
//   super.initState();
//   addData();
//   debugPrint("data add");
// }


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