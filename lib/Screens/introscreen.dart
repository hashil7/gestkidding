import 'package:flutter/material.dart';
import 'package:gestacare/Screens/signupscreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: screenWidth * 0.1,
                height: screenHeight * 0.1,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          child: Image.asset(
                            'assets/images/intro1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Eat Healthy',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          child: Text(
                            'Maintaining good health should be the primary focus of everyone.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentIndex == index ? 12 : 8,
                              height: _currentIndex == index ? 12 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? const Color(0xFFFF8473)
                                    : const Color(0xFFFFC0B8),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          child: Image.asset(
                            'assets/images/intro2.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Healthy Recipes',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          child: Text(
                            'Browse thousands of healthy recipes from all over the world.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentIndex == index ? 12 : 8,
                              height: _currentIndex == index ? 12 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? const Color(0xFFFF8473)
                                    : const Color(0xFFFFC0B8),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          child: Image.asset(
                            'assets/images/intro3.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Track your Health',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1),
                          child: Text(
                            'With amazing inbuilt tools you can track your progress.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentIndex == index ? 12 : 8,
                              height: _currentIndex == index ? 12 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? const Color(0xFFFF8473)
                                    : const Color(0xFFFFC0B8),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF3FA62E), // Fill color
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600, // Semibold
                            color: Colors.white,
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
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle Log in action
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF91C788),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              // Add more widgets here as needed
            ],
          ),
        ),
      ),
    );
  }
}
