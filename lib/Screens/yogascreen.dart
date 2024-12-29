import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class YogaScreen extends StatefulWidget {
  const YogaScreen({super.key});

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  Timer? _timer;
  int _seconds = 0;

  final String firstTrimesterImageUrl =
      'https://post.healthline.com/wp-content/uploads/2021/05/1178842-head-to-knee-forward-bend.png';
  final String secondTrimesterImageUrl =
      'https://post.healthline.com/wp-content/uploads/2021/05/1178842-bound-angle-pose.png';
  final String thirdTrimesterImageUrl =
      'https://post.healthline.com/wp-content/uploads/2021/05/1178842-warrior-II.png';

  void _startTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3, // Make container circular
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Colors.pinkAccent, Colors.purpleAccent],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${(_seconds ~/ 60).toString().padLeft(2, '0')}:${(_seconds % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _startTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                    child: const Text('Start'),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  ElevatedButton(
                    onPressed: _stopTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                    child: const Text('Stop'),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  ElevatedButton(
                    onPressed: _resetTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                        vertical: screenHeight * 0.015,
                      ),
                    ),
                    child: const Text('Reset'),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              _buildYogaCard(
                'First Trimester Yoga',
                firstTrimesterImageUrl,
                screenWidth,
                screenHeight,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildYogaCard(
                'Second Trimester Yoga',
                secondTrimesterImageUrl,
                screenWidth,
                screenHeight,
              ),
              SizedBox(height: screenHeight * 0.02),
              _buildYogaCard(
                'Third Trimester Yoga',
                thirdTrimesterImageUrl,
                screenWidth,
                screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYogaCard(
      String title, String imageUrl, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: screenWidth * 0.3,
                height: screenHeight * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
