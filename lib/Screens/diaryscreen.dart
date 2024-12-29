import 'package:flutter/material.dart';
import 'package:gestacare/Screens/basescreen.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final TextEditingController _noteController = TextEditingController();
  final List<Map<String, String>> _notes = [];
  // Instead of a simple list of strings,
  // store both the note text and date strings

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BaseScreen(
      currentIndex: 3, // Highlight the Diary tab
      appBar: AppBar(
        title: const Text(
          'Diary',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/diary_icon.png', // Path to your custom diary icon
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/peacock_feather.png', // Path to your custom peacock feather icon
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: const Color(0xFFCDE9F2), // Set background color
          padding:
              const EdgeInsets.all(20.0), // Add padding for entire contents
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Image.asset(
                        'assets/images/babycrawl.png',
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.mic,
                      color: Colors.black,
                      size: 50,
                    ),
                    onPressed: () {
                      // Handle voice input action
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: 20, // Number of dashed lines
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 10,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    TextField(
                      controller: _noteController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter your note here...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.02,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        decorationStyle: TextDecorationStyle.dashed,
                        decorationColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
