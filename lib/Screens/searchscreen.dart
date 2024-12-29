import 'package:flutter/material.dart';
import 'package:gestacare/Screens/basescreen.dart';
import 'package:image_picker/image_picker.dart'; // Add ImagePicker import
import 'package:http/http.dart' as http; // Add this import for http requests
import 'dart:convert'; // Add this import for json decoding

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  double protein = 0;
  double calories = 0;
  double fat = 0;
  double carbs = 0;

  Future<void> fetchNutrition(String searchInput) async {
    const apiUrl = 'https://api.calorieninjas.com/v1/nutrition?query=';
    final response = await http.get(
      Uri.parse(apiUrl + searchInput),
      headers: {'X-Api-Key': '6jpbc6TzuFOpl0zJXenHJg==aQx0Cq0gcEfI1rnn'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['items'] != null && data['items'].isNotEmpty) {
        final item = data['items'][0];
        setState(() {
          protein = item['protein_g'] ?? 0;
          calories = item['calories'] ?? 0;
          fat = item['fat_total_g'] ?? 0;
          carbs = item['carbohydrates_total_g'] ?? 0;
        });
      }
    } else {
      print("Error: ${response.statusCode}, ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BaseScreen(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF0D0D0D)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true, // Center the title
          title: const Text(
            'Search',
            style: TextStyle(color: Color(0xFF0D0D0D), fontSize: 12),
          ),
        ),
        currentIndex: 2,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.9, // Make width responsive
                      height: screenHeight * 0.08, // Make height responsive
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4), // Add fill color
                        borderRadius:
                            BorderRadius.circular(32.0), // Circular radius
                      ),
                      child: Center(
                        child: TextField(
                          textAlignVertical: TextAlignVertical
                              .center, // Center text vertically
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none, // Remove the border
                          ),
                          onSubmitted: (query) {
                            _showSearchResults(
                                query, screenWidth, screenHeight);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05), // Add spacing
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap:
                                  _openCamera, // Add onTap handler to open camera
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0xFF91C788), // Green fill color
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black,
                                      width: 2), // Black outline
                                ),
                                padding: const EdgeInsets.all(
                                    15), // Padding inside the circle
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors
                                      .black, // Icon color contrasting the fill
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Search through Scan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // Add the _openCamera method
  void _openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the scanned image, e.g., navigate to a scanning screen or process the image
    }
  }

  // Add the _showSearchResults method
  void _showSearchResults(String query, double width, double height) {
    fetchNutrition(query).then((_) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: width,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.network(
                    'https://loremflickr.com/600/400/$query',
                    height: height * 0.2,
                    width: width * 0.6,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: width,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8EE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Protein',
                                    style: TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '$protein g',
                                    style: const TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 20),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Calories',
                                    style: TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '$calories g',
                                    style: const TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 20),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Fat',
                                    style: TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '$fat g',
                                    style: const TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 20),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Carbs',
                                    style: TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '$carbs g',
                                    style: const TextStyle(
                                        color: Color(0xFFFF8473), fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          // Add to favorites action
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF3FA62E),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Add to Favorites',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
