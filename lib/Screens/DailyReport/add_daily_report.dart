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
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.search,color: Colors.black,size: 23,),
                        width: 25,
                        height: 50,
                      ),

                      Expanded(
                        child: TextFormField(
                          //  controller: searchController,
                          onChanged: (val){
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search....",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  //  controller: searchController,
                  onChanged: (val){
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Hospital Name",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      )
                  ),
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
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  //  controller: searchController,
                  onChanged: (val){
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Doctor Name",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            Container(
              decoration: ThemeHelper().inputBoxDecorationShaddow(),
              child:  Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400,width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  //  controller: searchController,
                  onChanged: (val){
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                      )
                  ),
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