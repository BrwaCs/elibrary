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
        ],
      )
    );
    
  }
}