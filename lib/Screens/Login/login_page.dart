import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:medilinks_doctor_app/Screens/ForgetPasswordScreen/forgot_password_page.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:medilinks_doctor_app/widgets/header_widget.dart';



class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  double _headerHeight = 300;
  var _formKey = GlobalKey<FormState>();
  bool obsecure = true;
  var _emailController = new TextEditingController();
  var _passwordlController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.appColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: _headerHeight,
            //   child: HeaderWidget(_headerHeight, false, Icons.login_rounded), //let's create a common header widget
            // ),

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
              ],
            ),


            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
              child: Column(
                children: [
                  Text(
                    'Login into your account',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  SizedBox(height: 30.0),
                  Form(
                    key: _formKey,
                      child: Column(
                        children: [
                          emailWidget(),
                          SizedBox(height: 20.0),
                          passwordWidget(),
                          SizedBox(height: 15.0),
                          forgetWidget(),
                          SizedBox(height: 5.0),
                          signInWidget(),
                        ],
                      )
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}



   extension loginWidget  on _LoginPageState
   {
     Widget emailWidget()
     {
       return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [

           Container(
             child: Text("Email ID*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
             ),
             padding: EdgeInsets.only(left: 20),
           ),

           SizedBox(height: 5,),

           Container(
             child: TextFormField(
               controller: _emailController,
               decoration: ThemeHelper().withoutLableInputDecoration('Email ID*', 'Enter Your Email ID'),
               validator: (value)
               {
                 if (value.toString() == "" || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value.toString()))
                 {
                   return 'Enter a valid email!';
                 }
                 return null;
               },
             ),
             decoration: ThemeHelper().inputBoxDecorationShaddow(),
           ),
         ],
       );
     }

     Widget passwordWidget()
     {
       return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [

           Container(
             child: Text("Password*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
             ),
             padding: EdgeInsets.only(left: 20),
           ),

           SizedBox(height: 5,),

           Container(
             child: TextFormField(
               controller: _passwordlController,
               obscureText: obsecure,
               decoration:InputDecoration(
                 hintText: "Enter Your Password",
                 fillColor: Colors.white,
                 filled: true,
                 suffixIcon: obsecure == true ? GestureDetector(
                   onTap: (){
                     obsecure = false;
                     setState(() {});
                   },
                   child: Container(
                     height: 10,
                     width: 10,
                     padding: EdgeInsets.all(10),
                     child: ClipRRect(
                         child: Image.asset("assets/images/invisible.png")),
                   ),
                 ) : GestureDetector(
                   onTap: (){
                     obsecure = true;
                     setState(() {});
                   },
                   child: Container(
                     height: 10,
                     width: 10,
                     padding: EdgeInsets.all(10),
                     child: ClipRRect(
                         child: Image.asset("assets/images/show.png")),
                   ),
                 ),
                 contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                 focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey)),
                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                 errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                 focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
               ),
               validator: (value) {
                 if (value.toString() == "" ) {
                   return 'Enter a valid Password!';
                 }
                 else if (value.toString().length < 8)
                 {
                   return "The password must be at least 8 characters.";
                 }
                 return null;
               },
             ),
             decoration: ThemeHelper().inputBoxDecorationShaddow(),
           ),
         ],
       );
     }

     Widget forgetWidget()
     {
       return InkWell(
         onTap: ()
         {
           Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
         },
         child: Container(
           margin: EdgeInsets.fromLTRB(10,0,10,20),
           alignment: Alignment.topRight,
           child: Text( "Forgot Password?", style: TextStyle( color: Colors.white, ),
           ),
         ),
       );
     }

     Widget signInWidget() {
       return Container(
         decoration: boxDecoration(context),
         child: ElevatedButton(
           style: ThemeHelper().buttonStyle(),
           child: Padding(
             padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
             child: Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
           ),
           onPressed: ()
           {
             replaceRoute(context, DashBoard(currentIndex: 0));

          //   apiCalling();
           },
         ),
       );
     }

     void apiCalling() async {
       if (_emailController.text.toString().toString() == "" || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.toString().toString())) {
         EasyLoading.showToast("Enter a valid email",
             dismissOnTap: true,
             duration: const Duration(seconds: 1),
             toastPosition: EasyLoadingToastPosition.center);

         return;
       }
       else if (_passwordlController.text.toString() == "" )
       {
         EasyLoading.showToast("Enter a valid Password!",
             dismissOnTap: true,
             duration: const Duration(seconds: 1),
             toastPosition: EasyLoadingToastPosition.center);

         return;
       }
       else if (_passwordlController.text.toString().length < 8)
       {
         EasyLoading.showToast("The password must be at least 8 characters.",
             dismissOnTap: true,
             duration: const Duration(seconds: 1),
             toastPosition: EasyLoadingToastPosition.center);

         return;
       }



       Map<String, String> params = new Map<String, String>();
       params["email"] = _emailController.text.toString();
       params["password"] = _passwordlController.text.toString();
       params["device_type"] = Platform.isAndroid ? "android" : "ios";
       params["device_token"] = "6w4r7hws";

       // Future.delayed(Duration.zero, () {
       //   showLoader(context);
       // });
       //
       // try {
       //   var id = await ApiRepo().loginResponse(params, context);
       // }
       //
       // catch(e){}
     }
   }





BoxDecoration boxDecoration(BuildContext context, [String color1 = "", String color2 = ""]) {
  Color c1 = Colors.white;
  Color c2 = Colors.white;
  if (color1.isEmpty == false) {
    c1 = HexColor(color1);
  }
  if (color2.isEmpty == false) {
    c2 = HexColor(color2);
  }

  return BoxDecoration(
    boxShadow: [
      BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0],
      colors: [
        c1,
        c2,
      ],
    ),
    color: Colors.deepPurple.shade300,
    borderRadius: BorderRadius.circular(30),
  );
}