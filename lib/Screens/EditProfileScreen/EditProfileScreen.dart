import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:medilinks_doctor_app/widgets/header_widget.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  bool obsecure = true;
  String? _experienceLocation;
  List<String> experience_list = ["0","1+","2+","3+", "4+","5+"];
  String? _genderLocation;
  List<String> gender_list = ["Male","Female"];
  String? _specialisationLocation;
  List<String> specialisation_list = ["Orthopedics","Internal Medicine","Obstetrics and Gynecology"];

  var _firstNameController = new TextEditingController();
  var _lastNameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var _confirmPasswordController = new TextEditingController();
  var _phoneController = new TextEditingController();
  var _pinCodeController = new TextEditingController();
  var _addressCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.appColor,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                Container(
                  height: 300,
                  child: const HeaderWidget(300, false, Icons.login_rounded,), //let's create a common header widget
                ),


                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
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
                          color: ConstColor.appColor,
                        ),
                      ),
                    ))
              ],
            ),


            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [


                            Container(
                                height: 120,
                                width: 120,
                                margin: EdgeInsets.only(left: 10,bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: Image.asset("assets/images/profile_image.png",fit: BoxFit.cover,height: 100,width: 100,))
                            ),


                            SizedBox(height: 30,),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Container(
                                        child: Text("First Name*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                        ),
                                        padding: EdgeInsets.only(left: 20),
                                      ),

                                      SizedBox(height: 5,),

                                      Container(
                                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                        child: TextFormField(
                                          controller: _firstNameController,
                                          decoration: ThemeHelper().textInputDecoration('First Name*', 'First name'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Container(
                                        child: Text("Last Name*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                        ),
                                        padding: EdgeInsets.only(left: 20),
                                      ),

                                      SizedBox(height: 5,),

                                      Container(
                                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                        child: TextFormField(
                                          controller: _lastNameController,
                                          decoration: ThemeHelper().textInputDecoration('Last Name*', 'Last name'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20.0),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text("Mobile Number*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.only(left: 20),
                                ),

                                SizedBox(height: 5,),

                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  child: TextFormField(
                                    controller: _phoneController,
                                    decoration: ThemeHelper().textInputDecoration(
                                        "Mobile Number*",
                                        "Mobile number"),
                                    keyboardType: TextInputType.phone,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20.0),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(
                                  child: Text("E-mail Address*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.only(left: 20),
                                ),

                                SizedBox(height: 5,),

                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: ThemeHelper().textInputDecoration("E-mail Address*", "E-mail address"),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (val)
                                    {
                                      if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),


                            const SizedBox(height: 20.0),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(
                                  child: Text("Gender*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.only(left: 20),
                                ),

                                SizedBox(height: 5,),

                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  child:  Container(
                                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey.shade400,width: 1),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: DropdownButton(
                                      underline: SizedBox(height: 0,),
                                      style: TextStyle(color: Colors.black,),
                                      hint: const Text('Choose Gender*'
                                        ,style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400
                                        ),), // Not necessary for Option 1
                                      value: _genderLocation,
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _genderLocation = newValue.toString();
                                        });
                                      },
                                      items: gender_list.map((location) {
                                        return DropdownMenuItem(
                                          child: new Text(location,style: const TextStyle(
                                            color: Colors.black,
                                          ),),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20.0),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(
                                  child: Text("Address*", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                                  ),
                                  padding: EdgeInsets.only(left: 20),
                                ),

                                SizedBox(height: 5,),

                                Container(
                                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                  child: TextFormField(
                                    controller: _addressCodeController,
                                    decoration: ThemeHelper().textInputDecoration(
                                        "Address*",
                                        "Address"),
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ],
                            ),


                            const SizedBox(height: 40.0),

                            Container(
                              decoration: boxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Edit Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                                ),
                                onPressed: ()
                                {

                                },
                              ),
                            ),

                             SizedBox(height: 40.0),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Positioned(
                    top: 60,
                      child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.only(left: 115),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black, width: 1)
                          ),
                          child: Icon(Icons.camera_alt ,color: Colors.black,)
                          )
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

