import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState() {
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                (context) => LoginPage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Image.asset("assets/images/app_logo.png",fit: BoxFit.contain,),
            )
          ],
        ),
      ),
    );
  }
}
