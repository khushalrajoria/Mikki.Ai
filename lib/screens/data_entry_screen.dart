import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class DiaryEntryScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 28),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 28, 28),
        title: const Text("Diary Entry",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 221, 115)),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Color.fromARGB(255, 255, 221, 115)),
                hintText: "Write your diary entry here...",hintStyle: TextStyle(color: Color.fromARGB(255, 255, 221, 115)),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                )
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll( Color.fromARGB(255, 255, 221, 115)) ),
            onPressed: () async {
            String entry = _controller.text;
            if (entry.isNotEmpty) {
              await Provider.of<ChatProvider>(context, listen: false)
                .getRecommendations(entry);
               Navigator.pushNamed(context, '/recommendations');
                 }
            },
               child: const Text("Get Movie Recommendations",style: TextStyle(color: Colors.black),),
          ),
          ],
        ),
      ),
    );
  }
}
