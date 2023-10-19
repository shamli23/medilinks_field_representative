import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';


class AddDailyReport extends StatefulWidget {
  const AddDailyReport({Key? key}) : super(key: key);
  @override
  State<AddDailyReport> createState() => _AddDailyReportState();
}

class _AddDailyReportState extends State<AddDailyReport> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  String? _hospitalLocation;
  List<String> hospital_list = ["SMS Hospital","Guru Nanak Hospital"];
  String? _doctorLocation;
  List<String> doctor_list = ["Sam","David"];



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
          "Add Daily Report",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
     body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        color: Colors.white,
        child: Column(
          children: [

            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/app_logo.png"),
            ),

            SizedBox(height: 50,),

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
                  hint: const Text('Choose A Hospital*'
                    ,style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                    ),
                  ), // Not necessary for Option 1
                  value: _hospitalLocation,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {});
                  },
                  items: hospital_list.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location,style: const TextStyle(
                        color: Colors.black54,
                      ),
                      ),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20.0),

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
                  hint: const Text('Choose A Doctor*'
                    ,style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                    ),
                  ), // Not necessary for Option 1
                  value: _doctorLocation,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {});
                  },
                  items: doctor_list.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location,style: const TextStyle(
                        color: Colors.black54,
                      ),
                      ),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 70.0),

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
    );
  }
}