import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/widgets/news_option.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final _newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    _newsController.updateNews();
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
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Obx(() {
              if (_newsController.articles.isEmpty &&
                  !_newsController.isLoading) {
                return const Center(
                  child: Text(
                    "Please check your connection!",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return Column(
                children: [
                  SizedBox(
                    height: 3.h,
                    child: _newsController.isLoading
                        ? const LinearProgressIndicator(
                            backgroundColor: Colors.white,
                          )
                        : const SizedBox.shrink(),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _newsController.articles.length,
                        itemBuilder: (context, i) => NewsOption(
                              article: _newsController.articles[i],
                            )),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
