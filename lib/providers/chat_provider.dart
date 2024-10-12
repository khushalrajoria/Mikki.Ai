import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatProvider with ChangeNotifier {
  List<String> _recommendations = [];
  List<String> get recommendations => _recommendations;

  final String apiKey = const String.fromEnvironment('API_KEY');

  Future<void> getRecommendations(String diaryEntry) async {
    if (apiKey.isEmpty) {
      print("No API Key provided.");
      return;
    }

    // Create the Gemini Generative Model instance
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );

    String prompt = "$diaryEntry is my diary entry for the day, give me 5 movie recommendations (names only) as a list. Based on this only, DO not ask for anyting else .";

    try {
      final response = await model.generateContent([Content.text(prompt)]);
      // Assume the API returns a list of movie recommendations
      _recommendations = response.text!.split("\n").where((line) => line.isNotEmpty).toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching recommendations: $e");
    }
  }
}
