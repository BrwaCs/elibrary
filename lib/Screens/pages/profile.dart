import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minimumSize: Size(95, 27),
                  // Foreground color
                  onPrimary: Colors.white,
                  // Background color
                  primary: Color.fromARGB(255, 30, 212, 0),
                            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0),
                            ),
                    onPressed: (){},
                            child: Text("Edit",
                            style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                            ),
                            ),
                            ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: ElevatedButton(
                    
                   style: ElevatedButton.styleFrom(
                     
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minimumSize: Size(95, 27),
                  // Foreground color
                  onPrimary: Colors.white,
                  // Background color
                  primary: Color.fromARGB(255, 212, 0, 0),
                            ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0),
                            ),
                    onPressed: (){},
                            child: Row(
                              children: [
                                Text("Logout ",
                                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                                ),
                                ),
                                Icon(
                                  Icons.logout_outlined,
                                  size: 16
                                )
                              ],
                            ),
                            ),
                ),
              ),
            ]
          ),
          Row(
         mainAxisAlignment:MainAxisAlignment.center,
         children: [

           CircleAvatar(
             backgroundColor: Colors.transparent,
             radius: 60,
             child: ClipRRect(
             child: Image.network("https://scontent.fisu1-4.fna.fbcdn.net/v/t39.30808-6/277813966_658645465433217_6596572273282071965_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uVJAMcTEE4MAX-7TQjv&_nc_oc=AQmJ6M4FPIsBIGTtBCZfQBK8enzmZtEDS2iojxd_zFFzZAmljshKY0LqjuRpo87hAbQ&_nc_ht=scontent.fisu1-4.fna&oh=00_AT_utjSMYSpmePyfhISMkn4G9igxlkiP-_yS7Bf-Fq7wpA&oe=62E30D2A"),
               borderRadius: BorderRadius.circular(60),
             ),
           )
         ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
            Text(
              "Brwa Nahman",
              style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.w500

              ),
            )
          ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text(
                "Reviews 10",
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children: [
                Text("bio",
                style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
                ),
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          Row( 
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: <Widget>[ 
              Container( width: 14.0, ),
               Flexible( 
                 child: Text("Sit veniam excepteur et commodo consequat velitsdihfioshe reprehenderit reprehenderit veniam voluptate incididunt magna culpa.Cillum duis enim pariatur adipisicing qui do non sint culpa.",
                 style: TextStyle(
                  fontSize: 14,
                  height: 1.25
                 )
                 ),
               ) 
               ], 
               ),
               SizedBox(height: 20,),
          Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize:16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
    
  }
}