import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:gestacare/Screens/basescreen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
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
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    String userMessage = _textController.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(text: userMessage, isUser: true));
      _isLoading = true;
      _textController.clear();
    });

    // Example Data: Get this from user settings in your app
    String trimester = "second"; // Assume second trimester
    String restrictions = "none"; // Assume no restrictions
    String concerns = "I feel tired often"; // Assume a general concern

    String prompt = """
  You are a nutritional assistant for pregnant women.

  Context:
  - The user is in their $trimester trimester of pregnancy.
  - The user has the following dietary restrictions: $restrictions.
  - The user has the following specific concerns or needs: $concerns.

  Task:
  Answer the question or provide the requested advice based on the user input

  Safety:
  - Provide only evidence-based nutritional advice, referencing reputable sources when appropriate.
  - Do not recommend any foods, supplements, or practices that are known to be unsafe for pregnant women.
  - If uncertain, clearly state that you cannot provide a recommendation and advise the user to consult their healthcare provider or a registered dietitian.
  - Use a supportive, informative, and non-alarmist tone. Also do not give very lengthy responses

  User Input: $userMessage
  """;

    try {
      final response = await _model.generateContent([
        Content.text(prompt),
      ]);
      final botMessage = response.text ?? 'Error: No response';
      setState(() {
        _messages.add(ChatMessage(text: botMessage, isUser: false));
      });
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(text: 'Error: $e', isUser: false));
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 4, // Set the appropriate index for the BaseScreen
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('BABY BOT'),
            Row(
              children: [
                const Text(
                  'online',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/babybot.png', // Path to your babybot image
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _clearChat,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          if (_isLoading) const LinearProgressIndicator(),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Message , here !',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isUser ? Colors.pink[50] : Colors.blue,
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: isUser ? Alignment.topRight : Alignment.topLeft,
      child: Text(text),
    );
  }
}
