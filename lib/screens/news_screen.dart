import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/text.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/utils/image_provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CachedImageContainer(
              imgUrl: article.urlToImage,
              borderRadius: 0,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                //back button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 42.w,
                          height: 42.w,
                          alignment: Alignment.center,
                          color: Colors.grey.withOpacity(0.2),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8)
                              //add more colors for gradient
                            ],
                            begin: Alignment
                                .topCenter, //begin of the gradient color
                            end: Alignment
                                .bottomCenter, //end of the gradient color
                            stops: [0, 0.8] //stops for individual color
                            //set the stops number equal to numbers of color
                            ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 250.h,
                        ),
                        //heading
                        Text(
                          article.title,
                          style: TextStyle(
                              fontSize: 29.sp, color: Color(0xfff2f2f2)),
                        ),
                        SizedBox(
                          height: 64.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(article.source.name,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Color(0xfff2f2f2))),
                              Text(article.publishedAt.substring(0, 10),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Color(0xfff2f2f2)))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          article.description,
                          style: TextStyle(
                              fontSize: 14.sp, color: Color(0xffbababa)),
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
