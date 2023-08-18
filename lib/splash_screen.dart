import 'dart:async';

import 'package:blood_donation_app/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {


  @override
  void initState() {
    super.initState();
 
    Timer(Duration(seconds: 6), () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  @override


  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Lottie.network('https://lottie.host/bdb7a6ba-3c2a-4e5b-8eb1-6b56ebc0ed94/OoN9lJsejH.json'),
    );
  }
}
