import 'package:android_and_ios/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUsersLoggedInStatusAndNavigate();
  }

  getUsersLoggedInStatusAndNavigate() async {
    final isLoggedIn = await SharedPref.getUserHasLoggedIn();
    if (isLoggedIn) {
      await Future.delayed(Duration(seconds: 3), () {
        Navigator.pushNamed(context, "/listing_screen");
      });
    } else {
      await Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/login_screen");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.ad_units,
          size: 40,
          color: Colors.purple,
        ),
      ),
    );
  }
}
