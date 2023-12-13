import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medilinks_doctor_app/Screens/Splash/splash_screen.dart';


void main() {
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = HexColor("#e12454");
  Color _accentColor = HexColor("#e12454");

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medilinks Field Representative App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        hintColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
        builder : EasyLoading.init()
    );
  }
}
