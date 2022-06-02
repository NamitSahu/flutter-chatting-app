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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDTdmN_4FpmcfZT7Wr4CW3plL9er1L0S24',
    appId: '1:369937960479:web:71d0d64bfc8231d44ccf2a',
    messagingSenderId: '369937960479',
    projectId: 'myshoppal-4a588',
    authDomain: 'myshoppal-4a588.firebaseapp.com',
    storageBucket: 'myshoppal-4a588.appspot.com',
    measurementId: 'G-3GJE3VRW31',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGczT-1CknszkWwcJZsWAWez2tCZ5-0ac',
    appId: '1:369937960479:android:0e000d7eaddb0c844ccf2a',
    messagingSenderId: '369937960479',
    projectId: 'myshoppal-4a588',
    storageBucket: 'myshoppal-4a588.appspot.com',
  );
}
