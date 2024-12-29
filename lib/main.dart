import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestacare/Screens/homescreen.dart';
import 'package:gestacare/Screens/introscreen.dart';
import 'package:gestacare/Screens/loginscreen.dart';
import 'package:gestacare/Screens/signupscreen.dart';
import 'package:gestacare/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Set the default font family to Signika
        fontFamily: 'Signika',
        brightness: Brightness.light, // Ensure light theme
        primaryColor: Colors.white, // Set primary color to white
        scaffoldBackgroundColor:
            Colors.white, // Set scaffold background to white
        canvasColor: Colors.white, // Ensures the root background is white
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white, // AppBar background color
          iconTheme: IconThemeData(color: Colors.black), // AppBar icon color
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 16), // AppBar title style
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // BottomNavigationBar background
          selectedItemColor: Color(0xFF579D4C), // Selected item color
          unselectedItemColor: Colors.grey, // Unselected item color
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          // ...add other text styles as needed
        ),
        // Remove primarySwatch if not needed
        // primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}
