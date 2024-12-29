import 'package:flutter/material.dart';
import 'package:gestacare/Screens/basescreen.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BaseScreen(
      currentIndex: 1,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  width: screenWidth * 0.9, // Make width responsive
                  height: screenHeight * 0.08, // Make height responsive
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4), // Add fill color
                    borderRadius:
                        BorderRadius.circular(32.0), // Circular radius
                  ),
                  child: const Center(
                    child: TextField(
                      textAlignVertical:
                          TextAlignVertical.center, // Center text vertically
                      decoration: InputDecoration(
                        hintText: 'Search for nutrition tips, recipes, etc.',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none, // Remove the border
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Row(
                  children: [
                    Text(
                      'Hot Now',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildHotNowCard(
                        'Healthy Pregnancy Diet',
                        'https://www.shutterstock.com/image-photo/fine-art-portrait-pregnant-woman-260nw-435591544.jpg',
                        screenWidth,
                      ),
                      const SizedBox(width: 10),
                      _buildHotNowCard(
                        'Nutritional Tips for Toddlers',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH4qkn5csAL0_YIzC5aBLtXikuUVUF7RmmJg&s',
                        screenWidth,
                      ),
                      const SizedBox(width: 10),
                      _buildHotNowCard(
                        'Quick & Healthy Recipes',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvq9NuDwK56r2DMf-E9W1BnLo94zJjOaC1Ow&s',
                        screenWidth,
                      ),
                      const SizedBox(width: 10),
                      _buildHotNowCard(
                        'Exercise During Pregnancy',
                        'https://www.shutterstock.com/image-photo/fine-art-portrait-pregnant-woman-260nw-435591544.jpg',
                        screenWidth,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                const Row(
                  children: [
                    Text(
                      'Trending',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Row(
                          children: [
                            Text(
                              'pregnancy Nutrition Guide',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFFF8473)),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.link,
                                color: Color(0xFFFF8473), size: 16),
                          ],
                        ),
                        onTap: () {
                          _launchURL('pregnancy Nutrition Guide');
                        },
                      ),
                      ListTile(
                        title: const Row(
                          children: [
                            Text(
                              'top 10 Healthy Recipes',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFFF8473)),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.link,
                                color: Color(0xFFFF8473), size: 16),
                          ],
                        ),
                        onTap: () {
                          _launchURL('top 10 Healthy Recipes');
                        },
                      ),
                      ListTile(
                        title: const Row(
                          children: [
                            Text(
                              'exercise Tips for New Moms',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFFF8473)),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.link,
                                color: Color(0xFFFF8473), size: 16),
                          ],
                        ),
                        onTap: () {
                          _launchURL('exercise Tips for New Moms');
                        },
                      ),
                      ListTile(
                        title: const Row(
                          children: [
                            Text(
                              'how to Manage Morning Sickness ',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFFF8473)),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.link,
                                color: Color(0xFFFF8473), size: 16),
                          ],
                        ),
                        onTap: () {
                          _launchURL('how to Manage Morning Sickness ');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHotNowCard(String title, String imageUrl, double screenWidth) {
    final cardWidth = screenWidth * 0.7;
    return Container(
      width: cardWidth,
      height: cardWidth * 0.8,
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
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String query) async {
    final url = 'https://www.google.com/search?q=$query';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
