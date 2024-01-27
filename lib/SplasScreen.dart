import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practiceproject/FristScreen.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => FristScreen(),
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
        "https://lottie.host/155abf07-78f8-4b3e-88ab-7797f1c1a0cc/Xyb5ieuHbW.json");
  }
}
