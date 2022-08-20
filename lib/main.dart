import 'package:flutter/material.dart';
import 'package:flutter_getx_app/content_page.dart';
import 'package:flutter_getx_app/my_detail_page.dart';
import 'package:flutter_getx_app/splash_screen.dart';
import 'package:get/get.dart';
// import 'content_page.dart';
// import 'my_detail_page.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(),
      initialRoute: "/",
      getPages: [
        // GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/", page: () => const MyHomePage()),
        GetPage(name: "/detail", page: () => const DetailPage()),
      ],
    );
  }
}
