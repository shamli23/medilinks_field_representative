import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/ChangePassword/change_password.dart';
import 'package:medilinks_doctor_app/Screens/EditProfileScreen/EditProfileScreen.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';

import '../../Constants/prefs_manager.dart';
import '../PrivacyPolicy/privacy_policy.dart';
import '../TermsAndConditions/terms_and_conditions.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.appColor,
        leadingWidth: 45,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Image.asset(
              "assets/images/back_button.png",
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "My Profile",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: ConstColor.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),


              Row(
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 10,bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset("assets/images/profile_image.png",fit: BoxFit.cover,height: 100,width: 100,))
                  ),


                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only( left: 10, right: 20),
                          child: Text(Prefs.check_name
                            ,style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                          ),
                        ),

                        SizedBox(height: 4,),

                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only( left: 10, right: 20),
                          child: Text(Prefs.check_email
                            ,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                            ),
                            maxLines: 2,
                          ),
                        ),

                        SizedBox(height: 3,),

                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only( left: 10, right: 20),
                          child: Text(Prefs.check_mobile
                            ,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]
                            ),
                          ),
                        ),

                        SizedBox(height: 7,),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 7,),

              // Container(
              //   decoration: const BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8),)
              //   ),
              //   margin: EdgeInsets.only(left: 10,right: 10),
              //   padding: EdgeInsets.only(top: 15,bottom: 15),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           alignment: Alignment.centerLeft,
              //           padding: EdgeInsets.only(left: 20, right: 20),
              //           child: Text("City"
              //             ,style: TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.black
              //             ),
              //           ),
              //         ),
              //       ),
              //
              //
              //       Container(
              //         alignment: Alignment.centerLeft,
              //         padding: EdgeInsets.only(left: 20, right: 20),
              //         child: Text("Mumbai"
              //           ,style: TextStyle(
              //               fontSize: 17,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.grey[600]
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // Container(
              //   height: 0.5,
              //   color: Colors.grey,
              //   margin : EdgeInsets.only(left: 20, right: 20),
              // ),


              InkWell(
                onTap: ()
                {
                  pushTo(context, EditProfileScreen());
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                  ),
                  margin: EdgeInsets.only(left: 10,right: 10),
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: Text("Edit Profile"
                            ,style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()
                        {
                          pushTo(context, EditProfileScreen());
                        },
                        child: Container(
                          child:  Icon(Icons.arrow_forward_ios_rounded, size: 17,color: Colors.grey[600],),
                        ),
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
              ),

              // Container(
              //   height: 0.5,
              //   color: Colors.grey,
              //   margin : EdgeInsets.only(left: 20, right: 20),
              // ),
              //
              // Container(
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //   ),
              //   margin: EdgeInsets.only(left: 10,right: 10),
              //   padding: EdgeInsets.only(top: 15,bottom: 15),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           alignment: Alignment.centerLeft,
              //           padding: EdgeInsets.only(left: 10, right: 20),
              //           child: Text("Contact Us"
              //             ,style: TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w500,
              //                 color: Colors.black
              //             ),
              //           ),
              //         ),
              //       ),
              //
              //
              //       GestureDetector(
              //         onTap: (){
              //           //    pushTo(context, PrivacyPolicyScreenView());
              //         },
              //         child: Container(
              //           child:  Icon(Icons.arrow_forward_ios_rounded, size: 17,color: Colors.grey[600],),
              //         ),
              //       ),
              //       const SizedBox(width: 10,),
              //     ],
              //   ),
              // ),

              Container(
                height: 0.5,
                color: Colors.grey,
                margin : EdgeInsets.only(left: 20, right: 20),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(width: 10,),

                    Expanded(child: GestureDetector(
                      onTap: ()
                      {pushTo(context, PrivacyPolicy());
                      },
                      child: Container(
                        child: const Text("Privacy Policy", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                        ),
                        ),
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    )
                    ),


                    GestureDetector(
                      onTap: (){
                       pushTo(context, PrivacyPolicy());
                      },
                      child: Container(
                        child:  Icon(Icons.arrow_forward_ios_rounded, size: 17,color: Colors.grey[600],),
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),

              Container(
                height: 0.5,
                color: Colors.grey,
                margin : EdgeInsets.only(left: 20, right: 20),
              ),

              Container(
                decoration: const BoxDecoration(
                    color: Colors.white
                ),
                height: 50,
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(width: 10,),

                    Expanded(child: GestureDetector(
                      onTap: ()
                      {
                        pushTo(context, TermsAndConditions());
                      },
                      child: Container(
                        child: const Text("Terms & Conditions", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                        ),
                        ),
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    )
                    ),


                    GestureDetector(
                      onTap: ()
                      {
                       pushTo(context, TermsAndConditions());
                      },
                      child: Container(
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 17,color: Colors.grey[600],),
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),

              Container(
                height: 0.5,
                color: Colors.grey,
                margin : EdgeInsets.only(left: 20, right: 20),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(width: 10,),

                    Expanded(
                        child: GestureDetector(
                          onTap: ()
                          {
                            pushTo(context, ChangePassword());
                          },
                          child: Container(
                            child: Text("Change Password", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                            ),
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        )
                    ),


                    GestureDetector(
                      onTap: (){
                        pushTo(context, ChangePassword());
                      },
                      child: Container(
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 17,color: Colors.grey[600],),
                      ),
                    ),


                    const SizedBox(width: 10,),

                  ],
                ),
              ),

              Container(
                height: 0.5,
                color: Colors.grey,
                margin : EdgeInsets.only(left: 20, right: 20),
              ),

              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
                ),
                height: 50,
                margin: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(width: 10,),

                    Expanded(child: GestureDetector(
                      onTap: ()
                      {
                        Prefs.clear();
                        replaceRoute(context, LoginPage());
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: const Text("Logout", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18
                        ),
                        ),
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    )),

                    const SizedBox(width: 10,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
