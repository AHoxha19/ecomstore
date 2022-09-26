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
    apiKey: 'AIzaSyBFs0CFOnZqZkofCPT6f7qOwnIKoEndlG0',
    appId: '1:781176942255:web:0b6088b307e52599626e5a',
    messagingSenderId: '781176942255',
    projectId: 'ecomstore-793b9',
    authDomain: 'ecomstore-793b9.firebaseapp.com',
    storageBucket: 'ecomstore-793b9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwgOcux4UfXE74-tyrf8VMdRgmAtYwgbg',
    appId: '1:781176942255:android:e32f1f71afc9ec10626e5a',
    messagingSenderId: '781176942255',
    projectId: 'ecomstore-793b9',
    storageBucket: 'ecomstore-793b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJfn87H-yP3VpNMUCFqGk4Tr_iaJ1P01s',
    appId: '1:781176942255:ios:163085e54e93ec6b626e5a',
    messagingSenderId: '781176942255',
    projectId: 'ecomstore-793b9',
    storageBucket: 'ecomstore-793b9.appspot.com',
    iosClientId: '781176942255-5qpv6d4v6humvfq99fd7fh9v3a4n3dt6.apps.googleusercontent.com',
    iosBundleId: 'ch.heiafr.tic.ecomstore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJfn87H-yP3VpNMUCFqGk4Tr_iaJ1P01s',
    appId: '1:781176942255:ios:163085e54e93ec6b626e5a',
    messagingSenderId: '781176942255',
    projectId: 'ecomstore-793b9',
    storageBucket: 'ecomstore-793b9.appspot.com',
    iosClientId: '781176942255-5qpv6d4v6humvfq99fd7fh9v3a4n3dt6.apps.googleusercontent.com',
    iosBundleId: 'ch.heiafr.tic.ecomstore',
  );
}
