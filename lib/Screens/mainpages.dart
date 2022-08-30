import 'package:elibrary/Auth/register.dart';
import 'package:elibrary/Screens/pages/auther.dart';
import 'package:elibrary/Screens/pages/category.dart';
import 'package:elibrary/Screens/pages/home.dart';
import 'package:elibrary/Screens/pages/review.dart';
import 'package:elibrary/Screens/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class mainpages extends StatefulWidget {
  const mainpages({Key? key}) : super(key: key);

  @override
  State<mainpages> createState() => _HomeState();
}

class _HomeState extends State<mainpages> {
  int currenttab=0;
  final List<Widget> screens=[
    Review(),
    Auther(),
    Category(),
    Setting(),
    home(),

  ];

  

  final PageStorageBucket bucket=new PageStorageBucket(); //what is this?
  Widget currentscreen=home();  // what is this?



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageStorage( // what is this?
        child:currentscreen ,
        bucket: bucket,
      
      ),
      // floatingActionButton:FloatingActionButton(//what is this ?
  
      // child:Icon(Icons.home),
      // onPressed:(){},  
      // ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar:BottomAppBar(
    color: Color.fromRGBO(13, 11, 38,1)
,
    // shape:CircularNotchedRectangle(),
   // notchMargin: 10,
    child: Container(
      height:55,
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children:<Widget>[ // why type widget here?

        //  tabbar icons
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth:40,
                onPressed: (){
                  setState(() {
                    currentscreen = Review();
                    currenttab=4;
                    
                  });

                },
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.star,
                      color:currenttab==4? Theme.of(context).primaryColor : Colors.grey,
                    ),
                    Text(
                      "Review",
                      style:TextStyle(
                        color: currenttab==4? Theme.of(context).primaryColor : Colors.grey,
                        fontSize:12,
                      ),
                    
                    ),
                  ],
                )
                ),
                MaterialButton(
                minWidth:40,
                onPressed: (){
                  setState(() {
                    currentscreen = Auther();
                    currenttab=1;
                    
                  });

                },
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color:currenttab==1? Theme.of(context).primaryColor : Colors.grey,
                    ),
                    Text(
                      "Author",
                      style:TextStyle(
                        color: currenttab==1? Theme.of(context).primaryColor : Colors.grey,
                        fontSize:12,
                      ),
                    
                    ),
                  ],
                )
                ),
                 MaterialButton(
                minWidth:40,
                onPressed: (){
                  setState(() {
                    currentscreen = home();
                    currenttab=0;
                    
                  });

                },
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color:currenttab==0? Theme.of(context).primaryColor : Colors.grey,
                    ),
                    Text(
                      "Home",
                      style:TextStyle(
                        color: currenttab==0? Theme.of(context).primaryColor : Colors.grey,
                        fontSize:12,
                      ),
                    
                    ),
                  ],
                )
                ),
                 MaterialButton(
                minWidth:40,
                onPressed: (){
                  setState(() {
                    currentscreen = Category();
                    currenttab=2;
                    
                  });

                },
                child:Column(
                       crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.category,
                      color:currenttab==2? Theme.of(context).primaryColor : Colors.grey,
                    ),
                    Text(
                      "Category",
                      style:TextStyle(
                        color: currenttab==2? Theme.of(context).primaryColor : Colors.grey,
                        fontSize:12,
                      ),
                    
                    ),
                  ],
                )
                ),
                MaterialButton(
                minWidth:40,
                onPressed: (){
                  setState(() {
                    currentscreen = Setting();
                    currenttab=3;
                    
                  });

                },
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.settings,
                      color:currenttab==3? Theme.of(context).primaryColor : Colors.grey,
                    ),
                    Text(
                      "Setting",
                      style:TextStyle(
                        color: currenttab==3? Theme.of(context).primaryColor : Colors.grey,
                        fontSize:12,
                      ),
                    
                    ),
                  ],
                )
                ),
            
            ],
          ),        
        ],

      ),

    ),

    )
    );
  }
}