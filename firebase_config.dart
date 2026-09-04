import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAv86w1jciX4tffHfIL7BpOIOVdVWlZ64w",
            authDomain: "my-city-days-ggrxe8.firebaseapp.com",
            projectId: "my-city-days-ggrxe8",
            storageBucket: "my-city-days-ggrxe8.firebasestorage.app",
            messagingSenderId: "543297787994",
            appId: "1:543297787994:web:02ca2c25fddb09d68d6063"));
  } else {
    await Firebase.initializeApp();
  }
}
