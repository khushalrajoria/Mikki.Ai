import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/chat_provider.dart';
import 'screens/recommendation_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Recommendation Chatbot',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DiaryEntryScreen(),
      routes: {
        '/recommendations': (context) => RecommendationScreen(),
      },
    );
  }
}
