
import 'package:elibrary/Auth/auth.dart';
import 'package:elibrary/Screens/mainpages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),  
         darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
       home:Auth(),
      );
    
        
  }
    );
}


}