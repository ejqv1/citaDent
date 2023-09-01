import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCM8otR1Swy9qq7M-Y-CGocB5FHve8O41Y",
            authDomain: "citadent-58721.firebaseapp.com",
            projectId: "citadent-58721",
            storageBucket: "citadent-58721.appspot.com",
            messagingSenderId: "1000793129962",
            appId: "1:1000793129962:web:7d5e98adaa0f8c11592893"));
  } else {
    await Firebase.initializeApp();
  }
}
