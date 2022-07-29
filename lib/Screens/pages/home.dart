import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/dataModels/book_datamodel.dart';
import 'package:elibrary/dataModels/book_mockdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        drawer: Drawer(
          
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height:155,
              child: UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/originals/dd/64/da/dd64da585bc57cb05e5fd4d8ce873f57.png"),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/library.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
        ),
            ),
            ListTile(
              leading: Icon(Icons.book,
              color: Theme.of(context).primaryColor,
              ),
              title: Text("New books",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star,
              color: Theme.of(context).primaryColor,),
              title: Text("Rating the app",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.report,
              color: Theme.of(context).primaryColor,),
              title: Text("About the application",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_box,
              color: Theme.of(context).primaryColor,),
              title: Text("About us",
              style:TextStyle(
                fontSize:16,
                fontWeight:FontWeight.w500
              ),),
              onTap: () {},
            )
          ]
        ),
      ),
      
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
     )
            
        ]
      ),
    );
     
  }
}