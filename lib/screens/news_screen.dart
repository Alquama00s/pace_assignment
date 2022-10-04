import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants/text.dart';
import 'package:news_app/utils/image_provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CachedImageContainer(
            imgUrl: "",
            borderRadius: 0,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ListView(
              children: [
                //back button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    child: Row(
                      children: [
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
                SizedBox(
                  height: 250.h,
                ),
                //heading
                Text(
                  'Do not upload the project to any online version control. This will disqualify the assignment immediately',
                  style: TextStyle(fontSize: 29.sp, color: Color(0xfff2f2f2)),
                ),
                SizedBox(
                  height: 64.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CNN",
                          style: TextStyle(
                              fontSize: 20.sp, color: Color(0xfff2f2f2))),
                      Text("29-05-2022",
                          style: TextStyle(
                              fontSize: 20.sp, color: Color(0xfff2f2f2)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  TextConst.loremIpsum,
                  style: TextStyle(fontSize: 14.sp, color: Color(0xffbababa)),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
