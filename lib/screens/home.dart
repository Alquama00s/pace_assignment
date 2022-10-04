import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_option.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 6, itemBuilder: (context, i) => NewsOption()),
    );
  }
}
