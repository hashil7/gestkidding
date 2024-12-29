import 'package:flutter/material.dart';
import 'package:gestacare/Screens/diaryscreen.dart';
import 'package:gestacare/Screens/homescreen.dart';
import 'package:gestacare/Screens/explorescreen.dart';
import 'package:gestacare/Screens/pregnanthome.dart';
import 'package:gestacare/Screens/searchscreen.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  final int currentIndex;
  final AppBar? appBar;

  const BaseScreen(
      {required this.child,
      required this.currentIndex,
      this.appBar,
      super.key});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PregnantHome()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ExploreScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const DiaryScreen()), // Assuming DiaryScreen exists
        );
        break;
      case 4:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ChatbotScreen()), // Assuming ChatbotScreen exists
        // );
        break;
      // Add cases for other screens as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Set white background
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Chatbot',
          ),
        ],
      ),
    );
  }
}
