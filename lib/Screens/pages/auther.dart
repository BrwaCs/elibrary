// ignore_for_file: unnecessary_import

import 'package:elibrary/Screens/pages/drawar.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/dataModels/aothe_data_model.dart';
import 'package:elibrary/dataModels/author_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Auther extends StatefulWidget {
  const Auther({Key? key}) : super(key: key);

  @override
  State<Auther> createState() => _AutherState();
}

class _AutherState extends State<Auther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
          backgroundColor:Colors.transparent,
          elevation:0,
        title: Text(
          "Author ",
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
           Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
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
      body: Center(  
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          
        ),
              itemCount: dataau.length,
              itemBuilder: (context, index) {
                List<AutherModel> _authermodl=dataau.map((element){
                  return AutherModel.fromMap(element);
                }
                 ).toList();
                return Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  children: [
                    Container(
                     height: 75,
                     width: 75,
                      child: CircleAvatar(
                      child: ClipRRect(
                       child: Image.network(_authermodl[index].image.toString()),
                       borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      child: Text(_authermodl[index].first_name.toString()
                      ),
                      ),
                    
                  ],
                ),
                
              );
              }
              ),
          )
          ),
          );
    
  }
}