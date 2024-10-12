import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class DiaryEntryScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diary Entry")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your diary entry here...",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String entry = _controller.text;
                if (entry.isNotEmpty) {
                  Provider.of<ChatProvider>(context, listen: false)
                      .getRecommendations(entry);
                }
              },
              child: Text("Get Movie Recommendations"),
            ),
          ],
        ),
      ),
    );
  }
}
