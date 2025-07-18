// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAxxYx-wCZdQEZ7TX-7Zvs0E7JBcOlNITQ',
    appId: '1:305125598851:web:2964753f17fa0502b7ddb6',
    messagingSenderId: '305125598851',
    projectId: 'login-c6374',
    authDomain: 'login-c6374.firebaseapp.com',
    storageBucket: 'login-c6374.firebasestorage.app',
    measurementId: 'G-4NPTBT43TW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGL0FUCiA1WBvihFe5qK8ME_T7qtQRNTw',
    appId: '1:305125598851:android:fd75a75b81f3b114b7ddb6',
    messagingSenderId: '305125598851',
    projectId: 'login-c6374',
    storageBucket: 'login-c6374.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAxxYx-wCZdQEZ7TX-7Zvs0E7JBcOlNITQ',
    appId: '1:305125598851:web:934b692b84152604b7ddb6',
    messagingSenderId: '305125598851',
    projectId: 'login-c6374',
    authDomain: 'login-c6374.firebaseapp.com',
    storageBucket: 'login-c6374.firebasestorage.app',
    measurementId: 'G-X85S2J476T',
  );
}
