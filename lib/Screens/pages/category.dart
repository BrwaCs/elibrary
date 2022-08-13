import 'package:elibrary/Screens/pages/drawar.dart';
import 'package:elibrary/Screens/pages/profile.dart';
import 'package:elibrary/dataModels/category_data_model.dart';
import 'package:elibrary/dataModels/category_mock_data.dart';
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
    
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 3,
           
          ), 
          itemCount: category_mock.length,
          itemBuilder: (context, index) {
          List<Category_datamodel> _catygoryModel=category_mock.map((element){
            return Category_datamodel.fromMap(element);
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
                       child: Image.network(_catygoryModel[index].image.toString()),
                       borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                    ),
                    SizedBox(height: 8,),
                    Container(
                      child: Text(_catygoryModel[index].first_name.toString()
                      ),
                      ),
                    
                  ],
                ),
                
              );
                  
        }
         

        ),
      )
   
   );
  }
}