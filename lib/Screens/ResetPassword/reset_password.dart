import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:medilinks_doctor_app/widgets/header_widget.dart';

import '../../repository/api_repo.dart';


class ResetPassword extends StatefulWidget {

  String email;
  String otp;
   ResetPassword(this.email,this.otp);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  double _headerHeight = 300;
  var _password = TextEditingController();
  var _confirmPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ConstColor.appColor,
      body: Column(
        children: [

          Stack(
            children: [
              Container(
                height: 300,
                child: HeaderWidget(300, false, Icons.password_rounded),
              ),

              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Image.asset("assets/images/app_logo.png"),
                ),
              ),


              Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        "assets/images/back_button.png",
                        fit: BoxFit.contain,
                        color: ConstColor.appColor,
                      ),
                    ),
                  )
              )
            ],
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 30,right: 30),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  <Widget>[

                  SizedBox(height: 15,),

                  Text(
                    'Reset your password',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),

                  SizedBox(height: 40,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        child: Text("New Password*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        padding: EdgeInsets.only(left: 20),
                      ),

                      SizedBox(height: 5,),

                      Container(
                        decoration: boxDecoration(context),
                        child: TextFormField(
                          obscureText: true,
                          controller: _password,
                          decoration: ThemeHelper().withoutLableInputDecoration('New Password*', 'Enter Your New Password'),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.03),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        child: Text("Confirm Password*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        padding: EdgeInsets.only(left: 20),
                      ),

                      SizedBox(height: 5,),

                      Container(
                        decoration: boxDecoration(context),
                        child:  TextFormField(
                          controller: _confirmPassword,
                          obscureText: true,
                          decoration:  ThemeHelper().withoutLableInputDecoration('Confirm Password*', 'Confirm Your New Password'),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 80),

                  Container(
                    decoration: ThemeHelper().verifyButtonDecoration(context),
                    child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text('Reset Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),
                      onPressed: (){
                        //After successful login we will redirect to profile page. Let's create profile page now
                        resetPassword();
                      },
                    ),
                  ),

                  SizedBox(height: size.height * 0.1),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void resetPassword()
  {
    Map<String, String> params = new Map<String, String>();
    params["email"] = widget.email.toString();
    params["verification_code"] = widget.otp.toString();
    params["password"] = _password.text;
    params["confirm_password"] = _confirmPassword.text;
    params["device_token"] = "6w4r7hws";
    params["device_type"] = Platform.isAndroid ? "android" : "ios";

    Future.delayed(Duration.zero, () {
      showLoader(context);
    });
    ApiRepo().resetPassword(params, context);
  }
}