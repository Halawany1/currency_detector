import 'package:currency_detector/scanner_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ScannerScreen(),));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'images/background.jpg', fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 300.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.green,
              ),
              child: Text('Welcome to the Currency Detector\n,'
                  'to get started click anywhere',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
