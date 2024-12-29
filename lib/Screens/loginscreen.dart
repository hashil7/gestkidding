import 'package:flutter/material.dart';
import 'package:gestacare/Screens/introscreen.dart';
import 'package:gestacare/Screens/signupscreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Avoid bottom overflow
        body: GestureDetector(
          onTap: () =>
              FocusScope.of(context).unfocus(), // Close keyboard on tap
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: Container(
                    width: screenWidth * 0.5,
                    height: screenHeight * 0.15,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  'Welcome Back 👋',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'We\'re glad to see you again.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'Log in to continue where you left off!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: const Color(0xFFD7F7C9), // Fill color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD7F7C9), // Border color
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'At least 8 characters',
                    filled: true,
                    fillColor: const Color(0xFFD7F7C9), // Fill color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFD7F7C9), // Border color
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Handle forgot password action
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF1E4AE9),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextButton(
                      onPressed: () {
                        // Handle sign in action
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF3FA62E), // Fill color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or sign in with',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextButton.icon(
                      onPressed: () {
                        // Handle Google sign in action
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFF3F9FA), // Fill color
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: Image.asset(
                        'assets/images/google.png', // Add your Google icon asset here
                        width: 24,
                        height: 24,
                      ),
                      label: const Text(
                        'Google',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t you have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IntroScreen()),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1E4AE9),
                          ),
                        ),
                      ),
                    ],
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
