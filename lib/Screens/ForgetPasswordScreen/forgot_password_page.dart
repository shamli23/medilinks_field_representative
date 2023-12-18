import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';
import 'package:medilinks_doctor_app/Screens/VerificationOtp/forgot_password_verification_page.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:medilinks_doctor_app/widgets/header_widget.dart';

import '../../repository/api_repo.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  var _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
        backgroundColor: ConstColor.appColor,
        body: SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                children: [
                  Container(
                    height: _headerHeight,
                    child: HeaderWidget(_headerHeight, false, Icons.password_rounded),
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


              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text('Enter the email address associated with your account.',
                              style: TextStyle(
                                // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text('We will email you a verification code to check your authenticity.',
                              style: TextStyle(
                                color: Colors.white,
                                // fontSize: 20,
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(
                                  child: Text("Email Id*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.only(left: 20),
                                ),

                                SizedBox(height: 5,),

                                Container(
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: ThemeHelper().withoutLableInputDecoration("Email Id", "Enter your Email Id"),
                                    // validator: (val){
                                    //   if(val!.isEmpty){
                                    //     return "Email Id can't be empty";
                                    //   }
                                    //   else if(!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                    //     return "Enter a valid email address";
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                              ],
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: boxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onPressed: () {

                                  if(_formKey.currentState!.validate())
                                  apiCalling();

                                //  apiCalling();
                                },
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "Remember your password? ",style: TextStyle( color: Colors.white),),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginPage()),
                                        );
                                      },
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}



 extension ApiCalling on _ForgotPasswordPageState {
   void apiCalling()
   {
     if (_emailController.text.toString().toString() == "" || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.toString().toString())) {
       EasyLoading.showToast("Enter a valid email",
           dismissOnTap: true,
           duration: const Duration(seconds: 1),
           toastPosition: EasyLoadingToastPosition.center);

       return;
     }

     Future.delayed(Duration.zero, () {
       showLoader(context);
     });
     Map<String, String> params = new Map<String, String>();
     params["email"] = _emailController.text.toString();

  ApiRepo().forgotPassword(params, context,_emailController.text.toString());
   }
 }