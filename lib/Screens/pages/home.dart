import 'package:elibrary/Screens/pages/drawar.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/dataModels/book_datamodel.dart';
import 'package:elibrary/dataModels/book_mockdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Home ",
          style: TextStyle(
            fontSize:24,
            fontWeight:FontWeight.normal,
            color:Colors.black
          )
          ),
          centerTitle: true,    
      actions: <Widget>[
       Padding(
      padding: EdgeInsets.only(right: 18),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
        },
        child: Icon(
          IconData(0xee35, fontFamily: 'MaterialIcons'),
          size: 26.0,   
        ),
      )
    ),
    ],
    // black line of the bottom AppBar
    bottom: PreferredSize(
      // ignore: sort_child_properties_last
      child: Container(
         color: Colors.black,
         height: 1.0,
      ),
      preferredSize: Size.fromHeight(1.5)
      ),
      iconTheme: IconThemeData(color:Theme.of(context).primaryColor),
      ),
        drawer: Drawar(),
      
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height:35,
                  width: 302,
                  child: TextFormField(
                    controller: _searchController,
                    decoration:InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15)
                      ),
                      prefixIcon:Icon(Icons.search),
                      labelText: "search for books",
                      labelStyle: TextStyle(
                        fontSize:16,
                        fontWeight: FontWeight.normal,
                      )
                    )
                  ),
                ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text(
                "Suggestion",
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.w500
                ),
              ),
            )
          ],
        ),
     
     Container(
       height: 200,
       width: double.infinity,
       child: ListView.builder(
         
         scrollDirection: Axis.horizontal,
         itemCount: book_mockdata.length,
         itemBuilder: ((context, index) {
           List<book_datamodel> _bookmodel=book_mockdata.map((element){
             return book_datamodel.fromMap(element);
           }).toList();
           return 
          Padding(
           padding: const EdgeInsets.all(12.0),
           child: Row(
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
                            child:FittedBox(
                              child: Image.network(_bookmodel[index].image.toString()),
                              fit: BoxFit.fill,
                            ) 
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    Row(
                      children: [
                        Text(_bookmodel[index].book_name.toString()),
                      ],
                    )
                  ],
                ),
               ),
              
               
             ],
           ),
         );
       
         }
         )
       ),
     ),
     SizedBox(height: 10,),
          Row(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text(
                "Newest",
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
        
     
     Container(
       height: 200,
       width: double.infinity,
       child: ListView.builder(
         
         scrollDirection: Axis.horizontal,
         itemCount: book_mockdata.length,
         itemBuilder: ((context, index) {
           List<book_datamodel> _bookmodel=book_mockdata.map((element){
             return book_datamodel.fromMap(element);
           }).toList();
           return 
          Padding(
           padding: const EdgeInsets.all(12.0),
           child: Row(
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
                            child:FittedBox(
                              child: Image.network(_bookmodel[index].image.toString()),
                              fit: BoxFit.fill,
                            ) 
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    Row(
                      children: [
                        Text(_bookmodel[index].book_name.toString()),
                      ],
                    )
                  ],
                ),
               ),
              
               
             ],
           ),
         );
       
         }
         )
       ),
     )
            
        ]
        
      ),
      
    );
     
  }
}