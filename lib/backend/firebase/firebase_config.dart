import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCnGb363MmDo5m81gm3Wj-jCPvp70FyHQw",
            authDomain: "querocard-93cd0.firebaseapp.com",
            projectId: "querocard-93cd0",
            storageBucket: "querocard-93cd0.appspot.com",
            messagingSenderId: "15567574895",
            appId: "1:15567574895:web:cd11178f7612a6385bfa9a",
            measurementId: "G-0954JKD8MQ"));
  } else {
    await Firebase.initializeApp();
  }
}
