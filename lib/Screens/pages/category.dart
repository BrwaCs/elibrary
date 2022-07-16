import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Category ",
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
        onTap: () {},
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
    
      body: Center(
        child: Text(
          "Category Screen",
          style: TextStyle(
            fontSize:40,
            fontWeight:FontWeight.bold),
           ),
      )
    );
  }
}