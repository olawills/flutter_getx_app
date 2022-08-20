import 'package:flutter/material.dart';
import 'package:flutter_getx_app/my_home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
          context,
          PageTransition(
              child: const MyHomePage(), type: PageTransitionType.leftToRight)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String constName = 'Flutter GetX';
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                constName,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: const Color(0xFF69c5df),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       top: 0,
      //       left: 0,
      //       height: 700,
      //       child: Container(
      //         height: 700,
      //         width: MediaQuery.of(context).size.width,
      //         decoration: const BoxDecoration(
      //           image: DecorationImage(
      //               image: AssetImage("img/background.jpg"), fit: BoxFit.cover),
      //         ),
      //       ),
      //     ),
      //     const Positioned(
      //       top: 50,
      //       left: 20,
      //       child: Text(
      //         'Flutter GetX',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 22,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
