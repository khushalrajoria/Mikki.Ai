import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatProvider with ChangeNotifier {
  List<String> _recommendations = [];
  List<String> get recommendations => _recommendations;

  Future<void> getRecommendations(String diaryEntry) async {
    String prompt = "$diaryEntry is my diary entry for the day, give me 5 movie recommendations based on this.";

    final response = await http.post(
      Uri.parse("https://api.gemini.com/recommendations"),
      headers: {
        "Authorization": "Bearer YOUR_GEMINI_API_KEY",
        "Content-Type": "application/json",
      },
      body: json.encode({"prompt": prompt}),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _recommendations = List<String>.from(data['recommendations']);
      notifyListeners();
    } else {
      print("Failed to fetch recommendations");
    }
  }
}
