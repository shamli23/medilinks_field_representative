import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:medilinks_doctor_app/widgets/header_widget.dart';

import '../../repository/api_repo.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool obsecure = true;

  var currPassController = TextEditingController();
  var newPassController = TextEditingController();
  var confirmPassController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _headerHeight = 300;

    return Scaffold(
      backgroundColor: ConstColor.appColor,
      // appBar: AppBar(
      //   backgroundColor: ConstColor.backgroundColor,
      //   leadingWidth: 50,
      //   leading: GestureDetector(
      //     onTap: ()
      //     {
      //       Navigator.pop(context);
      //     },
      //     child: Container(
      //       width: 35,
      //       height: 35,
      //       margin: EdgeInsets.only(left: 15,top: 8,bottom: 8),
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(10)
      //       ),
      //       child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,size: 20,),
      //     ),
      //   ),
      //   title: Text("Reset Password",
      //     style: TextStyle(
      //         fontSize: 20,
      //         fontWeight: FontWeight.w600,
      //         color: ConstColor.appColor
      //     ),
      //   ),
      //   centerTitle: true,
      // ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: _headerHeight,
                    child: HeaderWidget(
                        _headerHeight, false, Icons.privacy_tip_outlined),
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
                height: MediaQuery.of(context).size.height - 300,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  <Widget>[

                    SizedBox(height: 50),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          child: Text("Current Password*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          padding: EdgeInsets.only(left: 20),
                        ),

                        SizedBox(height: 5,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            obscureText: obsecure,
                            controller: currPassController,
                            decoration:InputDecoration(
                              hintText: "Current Password",
                              hintStyle: TextStyle(color: Colors.grey),
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
                              if (value.toString() == "" )
                              {
                                return 'Enter a valid Password!';
                              }
                              else if (value.toString().length < 8)
                              {
                                return "The password must be at least 8 characters.";
                              }
                              return null;
                            },
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
                          child: Text("New Password*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          padding: EdgeInsets.only(left: 20),
                        ),

                        SizedBox(height: 5,),

                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: newPassController,
                            obscureText: obsecure,
                            decoration:InputDecoration(
                              hintText: "New Password",
                              hintStyle: TextStyle(color: Colors.grey),
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
                              if (value.toString() == "" )
                              {
                                return 'Enter a valid Password!';
                              }
                              else if (value.toString().length < 8)
                              {
                                return "The password must be at least 8 characters.";
                              }
                              return null;
                            },
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
                          child: Text("Confirm New Password*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                          padding: EdgeInsets.only(left: 20),
                        ),

                        SizedBox(height: 5,),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child:  TextFormField(
                            controller: confirmPassController,
                            obscureText: obsecure,
                            decoration:InputDecoration(
                              hintText: "Confirm New Password",
                              hintStyle: TextStyle(color: Colors.grey),
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
                              if (value.toString() == "" )
                              {
                                return 'Enter a valid Password!';
                              }
                              else if (value.toString().length < 8)
                              {
                                return "The password must be at least 8 characters.";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 50),

                    Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                        style: buttonStyleChange(),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text('Change Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                        ),
                        onPressed: ()
                        {
                          updatePassword();
                        },
                      ),
                    ),

                    SizedBox(height: 20,)

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle buttonStyleChange() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shadowColor: MaterialStateProperty.all(Colors.white),
    );
  }

  updatePassword(){
    Map<String, String> params = new Map<String, String>();
    params["old_password"] = currPassController.text;
    params["new_password"] = newPassController.text;
    params["new_password_confirmation"] = confirmPassController.text;

    ApiRepo().changePasswordResponse(params,context);
  }

}



