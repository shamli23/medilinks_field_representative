import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/ResetPassword/reset_password.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:medilinks_doctor_app/widgets/header_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordVerificationPage extends StatefulWidget {
  final String? email;
  const ForgotPasswordVerificationPage({Key? key, this.email}) : super(key: key);

  @override
  _ForgotPasswordVerificationPageState createState() => _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;
  TextEditingController _codeController = TextEditingController();
  String otpCode = "";


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
                          children: [
                            Text('Verification',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Enter the verification code we just sent you on your email address.',
                              style: TextStyle(
                                // fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            PinCodeTextField(
                              backgroundColor: ConstColor.appColor,
                              appContext: context,
                              length: 6,
                              animationType: AnimationType.fade,
                              textStyle: TextStyle(color: Colors.white),
                              pinTheme: PinTheme(
                                selectedColor: Colors.white,
                                shape: PinCodeFieldShape.box,
                                activeColor: Colors.white,
                                inactiveColor: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.white,
                              ),
                              // focusNode: unitCodeCtrlFocusNode
                              autoFocus: true,
                              enablePinAutofill: true,
                              cursorColor: Colors.white,
                              animationDuration:
                              const Duration(milliseconds: 300),
                              // enableActiveFill: true,
                              controller: _codeController,
                              // focusNode: unitCodeCtrlFocusNode,
                              keyboardType: TextInputType.number,
                              boxShadows:  [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: ConstColor.appColor,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v)
                              {
                                otpCode = _codeController.text.toString();
                                setState((){});
                              },
                              // onTap: () {
                              //   print("Pressed");
                              // },
                              beforeTextPaste: (text) {
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                              onChanged: (String value) {  },
                            ),
                            SizedBox(height: 50.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "If you didn't receive a code! ",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Resend',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Container(
                                                height: 45,
                                                child: Column(
                                                  children: [
                                                    Text("Verification code resent",style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500
                                                    ),),
                                                    Text("successfully.",style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500
                                                     ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions:  [
                                                GestureDetector(
                                                  onTap:  ()
                                                  {
                                                    Navigator.pop(context);
                                                  //  resendOtpCalling();
                                                  },
                                                  child:  Container(
                                                    width : MediaQuery.of(context).size.width,
                                                    child: Center(
                                                      child: Container(
                                                        child: Text("OK",style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white),),
                                                        alignment: Alignment.center,
                                                        width: 100,
                                                        height: 45,
                                                        decoration: BoxDecoration(
                                                          color: Theme.of(context).primaryColor,
                                                          borderRadius: BorderRadius.circular(100),
                                                        ),
                                                        margin: EdgeInsets.only(bottom: 20)
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: _pinSuccess ? ThemeHelper().verifyButtonDecoration(context):ThemeHelper().verifyButtonDecoration(context, "#AAAAAA","#757575"),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Verify",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onPressed: ()
                                {
                                  pushTo(context, ResetPassword());
                                }
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



extension ApiCalling on _ForgotPasswordVerificationPageState
{
  // void verifyOtpCalling()
  // {
  //   if (_codeController.text.toString().length < 6) {
  //     EasyLoading.showToast("Enter a valid OTP",
  //         dismissOnTap: true,
  //         duration: const Duration(seconds: 1),
  //         toastPosition: EasyLoadingToastPosition.center);
  //
  //     return;
  //   }
  //
  //   Map<String, String> params = new Map<String, String>();
  //   params["email"] = widget.email.toString();
  //   params["verification_code"] = _codeController.text.toString();
  //
  //
  //   ApiRepo().VerifyOtpResponse(params, context);
  // }
  //
  //
  // void resendOtpCalling()
  // {
  //   Map<String, String> params = new Map<String, String>();
  //   params["email"] = widget.email.toString();
  //
  //
  //   ApiRepo().resendOtpResponse(params);
  // }
}