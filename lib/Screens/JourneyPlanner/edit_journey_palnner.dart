import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';

class EditJourneyPlaner extends StatefulWidget {
  const EditJourneyPlaner({Key? key}) : super(key: key);

  @override
  State<EditJourneyPlaner> createState() => _EditJourneyPlaner();
}

class _EditJourneyPlaner extends State<EditJourneyPlaner> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;


  var fromController = new TextEditingController();
  var toDateController = new TextEditingController();
  var doctorController = TextEditingController();
  List<String> doctors = [];



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
          "Edit Journey Planer",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          alignment: Alignment.topCenter,
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
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
              const SizedBox(height: 20.0),


              Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  controller: doctorController,
                  decoration: ThemeHelper().textInputDecoration('Doctor Name *', 'Enter Doctor Name'),

                ),
              ),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
                      onPressed: (){
                        if(doctorController.text.isNotEmpty){
                          doctors.add(doctorController.text);
                          setState(() {
                          });
                          doctorController.clear();
                        }
                      }, child: Text(
                    "Add",
                    style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),

              SizedBox(height: 20,),

              Flexible(
                flex: 2,
                child:doctors.isNotEmpty? ListView.separated(
                  itemCount: doctors.length,
                  itemBuilder: (context,index){
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(doctors[index],style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                              ),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  doctors.remove(doctors[index]);
                                  setState(() {

                                  });
                                },
                                child: Icon(Icons.remove_circle_outline,color: Colors.grey,))
                          ],
                        ));
                  }, separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 5,); },):SizedBox.shrink(),
              ),

              const SizedBox(height:20.0),

              Flexible(
                flex: 2,
                child: Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        "Update",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
