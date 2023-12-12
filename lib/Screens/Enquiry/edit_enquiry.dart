import 'package:flutter/material.dart';

import '../../Constants/const_files.dart';
import '../../common/theme_helper.dart';

class EditEnquiry extends StatefulWidget {
  const EditEnquiry({super.key});

  @override
  State<EditEnquiry> createState() => _EditEnquiryState();
}

class _EditEnquiryState extends State<EditEnquiry> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  List<String> gender_list = ["Single","Multiple"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Add Enquiry",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0,50, 0, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                alignment: Alignment.center,
                child: Image.asset("assets/images/app_logo.png"),
              ),

              SizedBox(height: 50,),

              Container(
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Test Name *', 'Enter Test name'),
                ),
              ),

              const SizedBox(height: 20.0),

              Container(
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Source *', 'Enter source'),
                ),
              ),

              const SizedBox(height: 20.0),

              Container(
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Doctor Name *', 'Enter doctor name'),
                ),
              ),

              const SizedBox(height: 20.0),

              Container(
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('City *', 'Enter city'),
                ),
              ),

              const SizedBox(height:60.0),

              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      "Submit",
                      style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (context) => ProfilePage()
                      //     ),
                      //         (Route<dynamic> route) => false
                      // );
                    }
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
