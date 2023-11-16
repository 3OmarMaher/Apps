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
    apiKey: 'AIzaSyDGHSP0XsMvy0T7WXXPWinjAZ_wvLheMAY',
    appId: '1:678600886500:web:24b725c70099fec5c644f1',
    messagingSenderId: '678600886500',
    projectId: 'projecttest-3b0b3',
    authDomain: 'projecttest-3b0b3.firebaseapp.com',
    storageBucket: 'projecttest-3b0b3.appspot.com',
    measurementId: 'G-7J5B8RP7KG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoBWQc2k5rcGdFXFGrbSClWruy7tgshVw',
    appId: '1:678600886500:android:003e6508b8ca6015c644f1',
    messagingSenderId: '678600886500',
    projectId: 'projecttest-3b0b3',
    storageBucket: 'projecttest-3b0b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeOIthNKzmsPuhmY9TclUnWa0wlqYw0Gc',
    appId: '1:678600886500:ios:6e6b09977b31426dc644f1',
    messagingSenderId: '678600886500',
    projectId: 'projecttest-3b0b3',
    storageBucket: 'projecttest-3b0b3.appspot.com',
    iosBundleId: 'com.example.graduationproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeOIthNKzmsPuhmY9TclUnWa0wlqYw0Gc',
    appId: '1:678600886500:ios:e59702af06fb05dfc644f1',
    messagingSenderId: '678600886500',
    projectId: 'projecttest-3b0b3',
    storageBucket: 'projecttest-3b0b3.appspot.com',
    iosBundleId: 'com.example.graduationproject.RunnerTests',
  );
}