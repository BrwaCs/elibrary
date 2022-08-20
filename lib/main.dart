
import 'package:elibrary/Auth/auth.dart';
import 'package:elibrary/Screens/handlerScreen/handler_screen.dart';
import 'package:elibrary/Screens/pages/Abotus.dart';
import 'package:elibrary/Screens/pages/show_books.dart';
import 'package:elibrary/Screens/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'firebase_options.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        themeMode: ThemeMode.light,
    
       home:HandlerScreen
       (),
      );
    
        
  }
    );
}


}



