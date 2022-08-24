
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

// List<Map<String,dynamic>> category=[{
//   "category": "IT",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FIT.jpg?alt=media&token=35a050b6-24e0-44dc-9c59-638a09386f00"
// }, {
//   "category": "Science",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2Fscince.jpg?alt=media&token=7fe28a71-a986-4ed2-8bf4-f80f2d0fb48e"
// }, {
//   "category": "Economy",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FEconomy.jpg?alt=media&token=948a4f23-4ab0-47e2-bd79-7db5bade78fe"
// }, {
//   "category": "Medical",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FMedical.jpg?alt=media&token=2cf203eb-c617-49a7-9af8-ed580f10d041"
// }, {
//   "category": "Psychologist",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FPsychologist.jpg?alt=media&token=05ee41b7-9e0c-4c3a-9162-da146d3d04f5"
// }, {
//   "category": "History",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FHistory.jpg?alt=media&token=78c1bd47-71aa-4319-93c7-427e4ea3c1e7"
// }, {
//   "category": "Story",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FStory.png?alt=media&token=9ff90ad7-bf22-44e7-a630-4808ee54df19"
// }, {
//   "category": "Children",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FChildren.jpg?alt=media&token=280e5d9e-ac7c-4f2e-ad09-443a472f5a17"
// }, {
//   "category": "Sports",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FSports.png?alt=media&token=7b4e9140-2125-4e6e-92e5-64c757933764"
// }, {
//   "category": "Languages",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FLanguages.jpg?alt=media&token=605a5ae2-48bf-407d-b9ba-ad8d3cb154a4"
// }, {
//   "category": "Cooking",
//   "categoryImage": "https://firebasestorage.googleapis.com/v0/b/myapplication-bcaee.appspot.com/o/catugoryImage%2FCooking.jpg?alt=media&token=826874b3-3394-4b3a-a736-5c11fc84366f"
// }, ];




// addData()async{
//   for(var element in category){
//     FirebaseFirestore.instance.collection("Category").add(element);
//   }
// }

//   @override
// void initState(){
//   super.initState();
//   addData();
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