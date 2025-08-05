import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD2KrDvwuVa0aQdDOknPhmsq8ILCO3Moyg",
      authDomain: "eccomerecapp.firebaseapp.com",
      projectId: "eccomerecapp",
      storageBucket: "eccomerecapp.appspot.com",
      messagingSenderId: "954187285020",
      appId: "1:954187285020:web:fe1c23e60057dab7eb55d9",
      measurementId: "G-7RGPX5MW17",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const LoginScreen(),
    );
  }
}
