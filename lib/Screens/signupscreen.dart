import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestacare/Screens/homescreen.dart';
import 'package:gestacare/Screens/pregnanthome.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController nationController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create your account',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Righteous',
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.1,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                SizedBox(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.05, // Increased height
                  child: TextField(
                    controller: fullNameController,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD7F7C9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          SizedBox(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.05, // Increased height
                            child: TextField(
                              controller: ageController,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFD7F7C9),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.01,
                                  horizontal: screenWidth * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          SizedBox(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.05, // Increased height
                            child: TextField(
                              controller: genderController,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFD7F7C9),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.01,
                                  horizontal: screenWidth * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                SizedBox(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.05, // Increased height
                  child: TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD7F7C9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                SizedBox(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.05, // Increased height
                  child: TextField(
                    controller: addressController,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: 'H.NO-/',
                      filled: true,
                      fillColor: Color(0xFFD7F7C9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'City',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                SizedBox(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.05, // Increased height
                  child: TextField(
                    controller: cityController,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD7F7C9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'State',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                SizedBox(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.05, // Increased height
                  child: TextField(
                    controller: stateController,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD7F7C9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Nation',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                SizedBox(
                  width: screenWidth * 0.87,
                  height: screenHeight * 0.05, // Increased height
                  child: TextField(
                    controller: nationController,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD7F7C9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () async {
                      try {
                        await _firestore.collection('users').add({
                          'fullName': fullNameController.text,
                          'age': ageController.text,
                          'gender': genderController.text,
                          'email': emailController.text,
                          'address': addressController.text,
                          'city': cityController.text,
                          'state': stateController.text,
                          'nation': nationController.text,
                        });
                        print("User details added to Firestore");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PregnantHome()),
                        );
                      } catch (e) {
                        print("Error: $e");
                      }
                    },
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        backgroundColor: Color(0xFF3FA62E)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300, // Semibold
                            color: Color(0xFFD7F769),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Color(0xFFD7F769),
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                // Add more widgets here as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}
