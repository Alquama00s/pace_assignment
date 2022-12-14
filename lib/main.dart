import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/app_colors.dart';
import 'package:news_app/screens/home.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/services/http_service.dart';
import 'package:news_app/services/permission_services.dart';
import 'package:news_app/widgets/news_option.dart';

void main() {
  runApp(const MyApp());
}

Future appInitialise() async {
  await PermissionServices.askPermission();
  await HttpService.initialise();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  // This is the theme of your application.
                  //
                  // Try running your application with "flutter run". You'll see the
                  // application has a blue toolbar. Then, without quitting the app, try
                  // changing the primarySwatch below to Colors.green and then invoke
                  // "hot reload" (press "r" in the console where you ran "flutter run",
                  // or simply save your changes to "hot reload" in a Flutter IDE).
                  // Notice that the counter didn't reset back to zero; the application
                  // is not restarted.
                  primarySwatch: AppColors.primaryMaterialColor,
                  fontFamily: 'Roboto-slab',
                  scaffoldBackgroundColor: Color(0xff424242)),
              home: FutureBuilder(
                future: appInitialise(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Home();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            ));
  }
}
