import 'package:flutter/material.dart';
import 'package:gestacare/Screens/basescreen.dart';
import 'package:gestacare/Screens/favoritescreen.dart';
import 'package:gestacare/Screens/profilescreen.dart';
import 'package:gestacare/Screens/yogascreen.dart'; // Import FavoritesScreen

class PregnantHome extends StatefulWidget {
  const PregnantHome({super.key});

  @override
  State<PregnantHome> createState() => _PregnantHomeState();
}

class _PregnantHomeState extends State<PregnantHome> {
  int _currentIndex = 0; // Default index set to 0

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BaseScreen(
      currentIndex: 0,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border, // Always unfilled in HomeScreen
              size: 32,
              color: Colors.black, // Unfilled color
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline, // Unfilled icon in HomeScreen
              size: 32,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            // Added Center widget
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add some spacing
                  Row(
                    children: [
                      Text(
                        'Hi mama',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gluten',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Image.asset(
                        'assets/images/babycrawl.png',
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.1,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  // Add some spacing
                  Row(
                    children: [
                      Text(
                        'Guess what ?!\nWe’re 24 weeks already\nI can’t wait to be in your arms .',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Image.asset(
                        'assets/images/babylaugh.png',
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.2,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03), // Add some spacing
                  SizedBox(
                    height: screenHeight * 0.22, // Decreased height
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      children: [
                        _buildCard(
                            '"Myth Buster: Facts vs. Fiction!"',
                            'The pros and cons of fast food.',
                            'assets/images/burger.png',
                            screenWidth,
                            screenHeight),
                        _buildCard(
                            'RECIPE',
                            'Fruit Salad',
                            'assets/images/strawberry.png',
                            screenWidth,
                            screenHeight),
                        _buildCard(
                            'AARTICLE',
                            'Balanced Meals',
                            'assets/images/burger.png',
                            screenWidth,
                            screenHeight),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02), // Add some spacing
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
                  SizedBox(height: screenHeight * 0.01), // Add some spacing
                  _buildProgressCard(screenWidth, screenHeight),
                  SizedBox(height: screenHeight * 0.02), // Add some spacing
                  _buildYogaMeditationCard(screenWidth, screenHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String type, String title, String imageUrl,
      double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.8,
      height: screenHeight * 0.15, // Decreased height
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF2F0), Color(0xFFFFF2F0), Color(0xFFFFF8EB)],
          stops: [0.0, 0.5, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
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
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF806E),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF330600)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8473),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Read Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(right: Radius.circular(15)),
                child: Image.asset(
                  imageUrl,
                  height: screenHeight *
                      0.1, // Adjusted image height to match card height
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.12, // Responsive card height
      decoration: BoxDecoration(
        color: const Color(0XFFA3A0CA),
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
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Track Your \nWeekly Progress',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            // Move button to the left by 40 pixels
            SizedBox(
              width: screenWidth * 0.35, // Set fixed width for the button
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View Now',
                      style: TextStyle(color: Color(0xFF9E9BC7)),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF9E9BC7),
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYogaMeditationCard(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.12, // Responsive card height
      decoration: BoxDecoration(
        color: const Color(0XFFB3E5FC),
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
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yoga & Meditation',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Find your inner peace',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            // Move button to the left by 40 pixels
            SizedBox(
              width: screenWidth * 0.35, // Set fixed width for the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const YogaScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start Now',
                      style: TextStyle(color: Color(0xFF0288D1)),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF0288D1),
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareCard(String title, String imageUrl, double screenWidth) {
    final cardWidth = screenWidth * 0.3;
    final cardHeight = screenWidth * 0.38;
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  width: cardWidth * 0.7, // reduce image size
                  height: cardWidth * 0.7, // keep smaller than card
                  fit: BoxFit.contain, // Use BoxFit.contain to avoid clipping
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
