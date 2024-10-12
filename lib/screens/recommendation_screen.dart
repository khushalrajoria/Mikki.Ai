import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class RecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recommendations = Provider.of<ChatProvider>(context).recommendations;

    return Scaffold(
      appBar: AppBar(title: const Text("Movie Recommendations")),
      body: recommendations.isEmpty
          ? const Center(child: const Text("No recommendations yet!"))
          : ListView.builder(
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recommendations[index]),
                );
              },
            ),
    );
  }
}
