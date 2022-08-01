import 'package:elibrary/Auth/login.dart';
import 'package:elibrary/Auth/register.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool switchescreen=true;
void togScreen(){
  setState(() {
    switchescreen=!switchescreen;
  });
}

  @override
  Widget build(BuildContext context) {
    if(switchescreen){
      return Login(togScreen: togScreen, );

    }
    return Register(togScreen:togScreen);
    
  }
}