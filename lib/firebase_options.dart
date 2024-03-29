// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCtnYTX5z_PkjvYS1VOaDR539jrTfIxqMM',
    appId: '1:509521685389:web:5fd560893e2061c9aa2bc4',
    messagingSenderId: '509521685389',
    projectId: 'myapplication-bcaee',
    authDomain: 'myapplication-bcaee.firebaseapp.com',
    storageBucket: 'myapplication-bcaee.appspot.com',
    measurementId: 'G-5WZJBMS3D0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAp-9vPxWmz_TcmlaiJscodWkZ165748dM',
    appId: '1:509521685389:android:7d8e0ca841640345aa2bc4',
    messagingSenderId: '509521685389',
    projectId: 'myapplication-bcaee',
    storageBucket: 'myapplication-bcaee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAre2V7N5iET1fiKraYPhC3aK9rWXxNOvg',
    appId: '1:509521685389:ios:7aefdd9736705bbeaa2bc4',
    messagingSenderId: '509521685389',
    projectId: 'myapplication-bcaee',
    storageBucket: 'myapplication-bcaee.appspot.com',
    iosClientId: '509521685389-4jgn3vu2oerj4tfhljf3plik51jj03qf.apps.googleusercontent.com',
    iosBundleId: 'com.example.elibrary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAre2V7N5iET1fiKraYPhC3aK9rWXxNOvg',
    appId: '1:509521685389:ios:7aefdd9736705bbeaa2bc4',
    messagingSenderId: '509521685389',
    projectId: 'myapplication-bcaee',
    storageBucket: 'myapplication-bcaee.appspot.com',
    iosClientId: '509521685389-4jgn3vu2oerj4tfhljf3plik51jj03qf.apps.googleusercontent.com',
    iosBundleId: 'com.example.elibrary',
  );
}
