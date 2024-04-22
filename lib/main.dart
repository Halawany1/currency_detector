import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:camera/camera.dart';
import 'package:currency_detector/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

late List<CameraDescription>cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Widget widget;

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            nextScreen: const HomeScreen(),
            duration: 1000,
            splashIconSize: 150.w,
            backgroundColor: Colors.white,
            splash: 'images/logo.png',
            curve: Curves.easeOutSine,
            pageTransitionType: PageTransitionType.rightToLeftWithFade,
            splashTransition: SplashTransition.sizeTransition,
          ),
        );
      },
    );
  }
}
