import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:mini_shop/pages/login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        finishCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Colors.red[400],
        imageAssetPath: 'assets/01.png',
        title: '',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: Colors.blue,
        imageAssetPath: 'assets/01.png',
        title: '',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: Colors.green,
        imageAssetPath: 'assets/01.png',
        title: '',
        body: 'Connect with the people from different places',
        doAnimateImage: true),
  ];
}
