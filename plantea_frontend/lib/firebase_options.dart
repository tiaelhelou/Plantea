import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyC1rY5qJjgpFa8zUTJ4_heJdHgCRJ-0AaI',
    appId: '1:86613155445:web:d34cfc4b73903fb20e223c',
    messagingSenderId: '86613155445',
    projectId: 'plantea-46392',
    authDomain: 'plantea-46392.firebaseapp.com',
    storageBucket: 'plantea-46392.appspot.com',
    measurementId: 'G-C7M7D8VN43',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgNGPj5pQdn913Fnt56fJ-etl6okXWMbE',
    appId: '1:86613155445:android:a9cb3cb65316f9150e223c',
    messagingSenderId: '86613155445',
    projectId: 'plantea-46392',
    storageBucket: 'plantea-46392.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDySCGL5LgphZ-fKqX7jave0hQRHql5PNk',
    appId: '1:86613155445:ios:50d95af3f3465de00e223c',
    messagingSenderId: '86613155445',
    projectId: 'plantea-46392',
    storageBucket: 'plantea-46392.appspot.com',
    iosBundleId: 'com.example.planteaFrontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDySCGL5LgphZ-fKqX7jave0hQRHql5PNk',
    appId: '1:86613155445:ios:50d95af3f3465de00e223c',
    messagingSenderId: '86613155445',
    projectId: 'plantea-46392',
    storageBucket: 'plantea-46392.appspot.com',
    iosBundleId: 'com.example.planteaFrontend',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1rY5qJjgpFa8zUTJ4_heJdHgCRJ-0AaI',
    appId: '1:86613155445:web:840d65baddabcc260e223c',
    messagingSenderId: '86613155445',
    projectId: 'plantea-46392',
    authDomain: 'plantea-46392.firebaseapp.com',
    storageBucket: 'plantea-46392.appspot.com',
    measurementId: 'G-DLXX1X4HPC',
  );
}
