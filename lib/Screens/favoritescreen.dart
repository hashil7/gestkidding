import 'package:flutter/material.dart';
import 'package:gestacare/Screens/basescreen.dart';
import 'package:gestacare/Screens/homescreen.dart';
import 'package:gestacare/Screens/searchscreen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool isLeftSelected = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Define screenWidth
    final screenHeight =
        MediaQuery.of(context).size.height; // Define screenWidth
    return BaseScreen(
      currentIndex: 0, // Set appropriate index if needed
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.black), // Unfilled Home icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              size: 32,
              color: Color(0xFF579D4C), // Filled green color
            ),
            onPressed: () {
              // Optionally, handle if needed
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              size: 32,
            ), // Use outlined person icon
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => setState(() => isLeftSelected = true),
                        style: TextButton.styleFrom(
                          backgroundColor: isLeftSelected
                              ? const Color(0xFFFF9385)
                              : const Color(0xFFFFF8EE),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(8)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Center(
                          child: Text(
                            'Food',
                            style: TextStyle(
                              color: isLeftSelected
                                  ? Colors.white
                                  : const Color(0xFFFF9385),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => setState(() => isLeftSelected = false),
                        style: TextButton.styleFrom(
                          backgroundColor: !isLeftSelected
                              ? const Color(0xFFFF9385)
                              : const Color(0xFFFFF8EE),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(8)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: Center(
                          child: Text(
                            'Recipes',
                            style: TextStyle(
                              color: !isLeftSelected
                                  ? Colors.white
                                  : const Color(0xFFFF9385),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Center vertically
                    children: [
                      Image.asset(
                        'assets/images/diet 1.png', // Food image
                        // Recipe image
                        width: screenWidth * 0.3, // Set desired width
                        height: screenHeight * 0.1, // Set desired height
                        fit: BoxFit.contain, // Adjust the image fit as needed
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.02), // Optional: Add spacing between image and text
                      Text(
                        isLeftSelected ? 'No Foods Found' : 'No Recipes Found',
                        style: const TextStyle(
                            color: Color(0xFF696969), fontSize: 22),
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.01), // Optional: Add spacing between texts
                      Text(
                        isLeftSelected
                            ? 'You haven\'t saved any food. Go ahead, search \nand save your favorite food'
                            : 'You haven\'t saved any recipe. Go ahead, search \nand save your favorite recipe',
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xFFA9A9A9)),
                        textAlign: TextAlign.center, // Center-align the text
                      ),
                    ],
                  ),
                ),
              ),
              // Add "Search Food" text button at the bottom
              Padding(
                padding:
                    const EdgeInsets.all(20.0), // Add padding around the button
                child: SizedBox(
                  width: screenWidth * 0.8, // Make the button full-width
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF91C788), // Green background
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // Vertical padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Search Food',
                      style: TextStyle(
                        color: Colors.white, // Button text color
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
