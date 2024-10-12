import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendations = Provider.of<ChatProvider>(context).recommendations;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 28),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 28, 28),
        title: const Text("Movie Recommendations",style: TextStyle(color: const Color.fromARGB(255, 255, 221, 115),fontWeight: FontWeight.bold),)),
      body: recommendations.isEmpty
          ? const Center(child:Text("No recommendations yet!",style: TextStyle(color: Color.fromARGB(255, 255, 221, 115)),))
          : ListView.builder(
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recommendations[index],style: const TextStyle(color: const Color.fromARGB(255, 255, 221, 115)),),
                );
              },
            ),
    );
  }
}
