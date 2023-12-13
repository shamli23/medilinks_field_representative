import 'package:flutter/material.dart';

import '../../Constants/const_files.dart';
import '../../common/theme_helper.dart';
import '../../models/enquiry_list_response.dart';
import '../../repository/api_repo.dart';

class EditEnquiry extends StatefulWidget {
  Enquiries? enquiry;
   EditEnquiry(this.enquiry);

  @override
  State<EditEnquiry> createState() => _EditEnquiryState();
}

class _EditEnquiryState extends State<EditEnquiry> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  List<String> tests = [];
  String? _testName;
  var _sourceController = TextEditingController();
  var _doctorNameController = TextEditingController();
  var _cityController = TextEditingController();



  fetchTestName()async{
    var response = await ApiRepo().getMedicalTests();
    if(response != null){
      for(var data in response.medicalTests!){
        tests.add(data.title??"");
        setState(() {
        });
      }

      for(int i = 0; i < response.medicalTests!.length; i++){


        if(response.medicalTests![i].title!.toLowerCase().toString() == widget.enquiry!.testName!.toLowerCase().toString())
        {


        _testName = response.medicalTests![i].title;
        }
        setState(() {
        });
      }

    }
  }

  int? index;

  @override
  void initState() {
    fetchTestName();
    setState(() {
      _sourceController.text = widget.enquiry?.source??"";
      _doctorNameController.text = widget.enquiry?.doctorName??"";
      _cityController.text = widget.enquiry?.city??"";
    });

    super.initState();
  }

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
          "Edit Enquiry",
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
          child: Form(
            key: _formKey,
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
                      hint: const Text('Test Name *'
                        ,style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                        ),
                      ), // Not necessary for Option 1
                      value: _testName,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      onChanged: (String? newValue) {

                        setState(() {
                          _testName = newValue;
                        });
                      },
                      items: tests.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location??"",style: const TextStyle(
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
                  child: TextFormField(
                    controller:_sourceController,
                    decoration: ThemeHelper().textInputDecoration('Source *', 'Enter source'),
                  ),
                ),

                const SizedBox(height: 20.0),

                Container(
                  margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  child: TextFormField(
                    controller: _doctorNameController,
                    decoration: ThemeHelper().textInputDecoration('Doctor Name *', 'Enter doctor name'),
                  ),
                ),

                const SizedBox(height: 20.0),

                Container(
                  margin: const EdgeInsets.fromLTRB(25,0, 25, 0),
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  child: TextFormField(
                    controller: _cityController,
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
                        updateEnquiry(context);
                      }
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  updateEnquiry(BuildContext context)async{
    Map<String, String> params = new Map<String, String>();
    params["test_name"] = (_testName!=null?_testName:widget.enquiry?.testName)??"";
    params["source"] = _sourceController.text.toString();
    params["doctor_name"] = _doctorNameController.text.toString();
    params["city"] = _cityController.text.toString();

    Future.delayed(Duration.zero, () {
      showLoader(context);
    });

    await ApiRepo().updateEnquiry(params, context, widget.enquiry?.id.toString()??"");
  }

}
