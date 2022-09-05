import 'package:elibrary/Screens/pages/drawar.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Review ",
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
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                
                IconButton(onPressed: (){}, icon:Icon(Icons.dark_mode)),
                  Text("Darkmode",
                  style:TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.bold
                  ) ,
                  ),
            Padding(
              padding: const EdgeInsets.only(left:180.0,top:10.0,),
              child: IconButton(
                icon: const Icon(Icons.lightbulb),
                onPressed: () {
                  Get.isDarkMode
                      ? Get.changeTheme(ThemeData.light())
                      : Get.changeTheme(ThemeData.dark());
                }),
            )
        ],
              
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.snackbar("Update", "The current Version is latest");
            },
            child: Row(
              children: [
                
                IconButton(
                  onPressed: (){
                    Get.snackbar("Update", "The current Version is latest");
                  },
                 icon: Icon(Icons.update)
                 ), Text("Check for update",
                    style:TextStyle(
                      fontSize:16,
                      fontWeight: FontWeight.bold
                    ) ,
                    ),
              ],
            ),
          )
        ],
      )
    );
  }
}