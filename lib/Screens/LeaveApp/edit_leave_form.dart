import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';


class EditLeaveForm extends StatefulWidget {
  const EditLeaveForm({Key? key}) : super(key: key);

  @override
  State<EditLeaveForm> createState() => _EditLeaveForm();
}

class _EditLeaveForm extends State<EditLeaveForm> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  String? _leaveName;
  List<String> leave_list = ["Single","Multiple"];
  String? _leaveLocation;
  List<String> leave_type = ["Casual Leave","Sick Leave"];

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
          "Leave App",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/images/app_logo.png"),
              ),

              SizedBox(height: 50,),


              Container(
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
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
                    hint: const Text('Type Of Leave *'
                      ,style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                      ),
                    ), // Not necessary for Option 1
                    value: _leaveLocation,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _leaveLocation = newValue!;
                      });
                    },
                    items: leave_type.map((location) {
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
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
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
                    hint: const Text('Single/Multiple *'
                      ,style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                      ),
                    ), // Not necessary for Option 1
                    value: _leaveName,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _leaveName = newValue!;
                      });
                    },
                    items: leave_list.map((location) {
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
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                child: Row(
                  children: [
                    Expanded(
                      child:  Container(
                        decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        child: TextFormField(
                          controller: fromController,
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

                    _leaveName == "Single"?SizedBox.shrink():Expanded(
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
                                lastDate: DateTime(2100)
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




              const SizedBox(height: 20.0),

              Container(
                margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  minLines: 4,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration:  InputDecoration(
                    hintText: "Reason *",
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
              ),


              const SizedBox(height:50.0),

              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      "Submit",
                      style:  const TextStyle(
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