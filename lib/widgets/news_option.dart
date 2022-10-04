import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/utils/image_provider.dart';

class NewsOption extends StatelessWidget {
  const NewsOption({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsScreen(
                    article: article,
                  ))),
      child: SizedBox(
        height: 220.h,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: CachedImageContainer(
                imgUrl: article.urlToImage,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(12.h),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black
                        //add more colors for gradient
                      ],
                      begin: Alignment.topCenter, //begin of the gradient color
                      end: Alignment.bottomCenter, //end of the gradient color
                      stops: [0, 0.8] //stops for individual color
                      //set the stops number equal to numbers of color
                      ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20.sp, color: Color(0xfff2f2f2)),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    '${article.source.name}      ${article.publishedAt.substring(0, 10)}',
                    style: TextStyle(fontSize: 12.sp, color: Color(0xffbababa)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
