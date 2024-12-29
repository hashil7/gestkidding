import 'package:flutter/material.dart';
import 'package:gestacare/Screens/basescreen.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final List<TextEditingController> _noteControllers = List.generate(
    20,
    (index) => TextEditingController(),
  );
  final List<Map<String, String>> _notes = [];
  late GenerativeModel _model;
  final String apiKey =
      'AIzaSyD0UtUz1sg1uPCMvOMYzh5G9hzZdBOFYL8'; // Replace with your actual API key
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          topK: 40,
          topP: 0.95,
          maxOutputTokens: 8192,
        ));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BaseScreen(
      currentIndex: 3,
      appBar: AppBar(
        title: const Text(
          'Diary',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/diary_icon.png',
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/peacock_feather.png',
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/peacock.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: const Color(0x80CDE9F2),
              padding: const EdgeInsets.all(20.0),
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
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
                  Container(
                    height: screenHeight * 0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children:
                            List.generate(_noteControllers.length, (index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 0),
                            child: TextField(
                              controller: _noteControllers[index],
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
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
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            _analyzeEmotionsAndShowChart(
                                context, screenWidth, screenHeight);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFD7F7C9),
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                              horizontal: screenWidth * 0.1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Upload',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.history,
                            color: Colors.black,
                            size: 16,
                          ),
                          onPressed: () {
                            // Handle history action
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _analyzeEmotionsAndShowChart(
      BuildContext context, double screenWidth, double screenHeight) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await _model.generateContent([
        Content.text("""
      Analyze the following text and give the emotional breakdown in any format. 
      Then provide short advice for well-being: 
      
      ${_noteControllers.map((controller) => controller.text).join(' ')}
      """)
      ]);

      if (response.text != null) {
        _showEmotionChart(context, screenWidth, screenHeight, response.text!);
      } else {
        _showEmotionChart(
            context, screenWidth, screenHeight, 'No response from the model.');
      }
    } catch (e) {
      _showEmotionChart(context, screenWidth, screenHeight, 'Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showEmotionChart(BuildContext context, double screenWidth,
      double screenHeight, String responseText) {
    // Remove asterisks from the response text
    String cleanedResponseText = responseText.replaceAll('*', '');

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
            height: screenHeight * 0.6,
            width: screenWidth,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  text: TextSpan(
                    children: cleanedResponseText.split('\n').map((line) {
                      return TextSpan(
                        text: line + '\n',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _getTextColor(line),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getTextColor(String line) {
    if (line.contains('anger')) {
      return Colors.red;
    } else if (line.contains('happiness')) {
      return Colors.green;
    } else if (line.contains('sadness')) {
      return Colors.blue;
    } else if (line.contains('surprise')) {
      return Colors.yellow;
    } else {
      return Colors.black;
    }
  }
}
