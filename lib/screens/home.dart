import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/widgets/news_option.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            'H E A D L I N E S',
            style: TextStyle(fontSize: 29.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
            itemCount: 6, itemBuilder: (context, i) => NewsOption()),
      ),
    );
  }
}
