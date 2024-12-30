import 'package:flutter/material.dart';
import 'package:google_gemini_ai/google_gemini_ai.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
    var apiKey = '';
  // Simulate interaction with Gemini API or similar
  Future<String> sendMessageToGemini(String message) async {
    final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:"); // Replace with actual Gemini API endpoint
    // Creating the request payload (assuming a JSON structure)
    final Map<String, dynamic> requestPayload = {
      "message": message,
    };
    // Send request to the Gemini API

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
          // Add your API key in Authorization header if needed

        },
        body: json.encode(requestPayload),
      );

      if (response.statusCode == 200) {
        // Assuming the AI returns a JSON response with the response message
        final data = json.decode(response.body);
        return data[
            'response']; // Change based on the actual API response format
      } else {
        return 'Error: Unable to get response from Gemini AI';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({"sender": "user", "message": _controller.text});
      });

      String aiResponse = await sendMessageToGemini(_controller.text);

      setState(() {
        messages.add({"sender": "gemini", "message": aiResponse});
      });

      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Gemini Chat",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                return ListTile(
                  title: Align(
                    alignment: message['sender'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message['sender'] == 'user'
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        message['message']!,
                        style: TextStyle(
                            color: message['sender'] == 'user'
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
