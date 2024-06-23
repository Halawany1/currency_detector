import 'package:audioplayers/audioplayers.dart';
import 'package:currency_detector/scanner_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AudioPlayer player = AudioPlayer();

  @override
 void initState() {
    super.initState();
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource('homepage.mp3'));
      await player.resume();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScannerScreen(
                ),
              ));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 300.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.green,
              ),
              child: Text(
                'Welcome to the Currency Detector\n,'
                'to get started click anywhere',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Positioned(
              bottom: 40.h,
              child: Container(
                width: 300.w,
                padding:EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    Text('Recommended Apps',
                      style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                   SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/png.webp',
                          width: 60.w,
                          height: 60.w,
                        ),

                        Image.asset(
                          'images/unnamed.webp',
                          width: 60.w,
                          height: 60.w,
                        ),
                        Image.asset(
                          'images/unnamed (1).webp',
                          width: 60.w,
                          height: 60.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
