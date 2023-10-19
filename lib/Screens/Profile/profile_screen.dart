import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/ChangePassword/change_password.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';


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
        color: Colors.white,
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


                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only( left: 10, right: 20),
                        child: Text("John Martin"
                          ,style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),
                        ),
                      ),

                      SizedBox(height: 7,),

                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only( left: 10, right: 20),
                        child: Text("johnmartin1999@gmail.com"
                          ,style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]
                          ),
                        ),
                      ),

                      SizedBox(height: 7,),
                    ],
                  )
                ],
              ),

              SizedBox(height: 7,),

              Container(
                height: 0.5,
                color: Colors.grey,
                margin : EdgeInsets.only(left: 20, right: 20),
              ),

              SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("City"
                        ,style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),


                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Mumbai"
                      ,style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600]
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Container(
                height: 0.5,
                color: Colors.grey,
                margin : EdgeInsets.only(left: 20, right: 20),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
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
                        //  pushTo(context, PrivacyPolicyScreenView());
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
                        //    pushTo(context, PrivacyPolicyScreenView());
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
                        //  pushTo(context, PrivacyPolicyScreenView());
                      },
                      child: Container(
                        child: const Text("Contact Us", style: TextStyle(
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
                        //    pushTo(context, PrivacyPolicyScreenView());
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
                        //  pushTo(context, PrivacyPolicyScreenView());
                      },
                      child: Container(
                        child: Text("Terms & Conditions", style: TextStyle(
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
                        //    pushTo(context, PrivacyPolicyScreenView());
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
                        pushTo(context, ChangePassword());
                      },
                      child: Container(
                        child: const Text("Change Password", style: TextStyle(
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
                        //    pushTo(context, PrivacyPolicyScreenView());
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
                        replaceRoute(context, LoginPage());
                      },
                      child: Container(
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
                    )
                    ),


                    GestureDetector(
                      onTap: (){
                        replaceRoute(context, LoginPage());
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


            ],
          ),
        ),
      ),

    );
  }
}