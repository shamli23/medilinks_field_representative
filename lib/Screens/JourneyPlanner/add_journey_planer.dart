import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';

class AddJourneyPlaner extends StatefulWidget {
  const AddJourneyPlaner({Key? key}) : super(key: key);

  @override
  State<AddJourneyPlaner> createState() => _AddJourneyPlanerState();
}

class _AddJourneyPlanerState extends State<AddJourneyPlaner> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;


  var fromController = new TextEditingController();
  var toDateController = new TextEditingController();



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
          "Add Journey Planer",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        alignment: Alignment.topCenter,
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/app_logo.png"),
              ),

              SizedBox(height: 50,),

              Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('City *', 'Enter City'),
                ),
              ),

              const SizedBox(height: 20.0),

              Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration('Doctor Name *', 'Enter Doctor Name'),
                ),
              ),


              const SizedBox(height: 20.0),

              Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(
                  children: [
                    Expanded(
                      child:  Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: fromController,
                          keyboardType: TextInputType.none,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100)
                            );
                            if (pickedDate != null) {
                              print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                fromController.text = formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                          decoration: ThemeHelper().textInputDecoration('From Date *', ''),
                        ),
                      ),
                    ),

                    SizedBox(width: 15,),

                    Expanded(
                      child:  Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: toDateController,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                              String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                toDateController.text = formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                          decoration: ThemeHelper().textInputDecoration('To Date *', ''),
                        ),
                      )
                      ,)
                  ],
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
