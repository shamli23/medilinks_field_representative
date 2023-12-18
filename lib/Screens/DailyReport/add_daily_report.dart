import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:search_map_location/utils/google_search/latlng.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:search_map_location/utils/google_search/place_type.dart';
import 'package:search_map_location/widget/search_widget.dart';
import 'package:geolocator/geolocator.dart';

import '../../repository/api_repo.dart';


class AddDailyReport extends StatefulWidget {
  const AddDailyReport({Key? key}) : super(key: key);
  @override
  State<AddDailyReport> createState() => _AddDailyReportState();
}

class _AddDailyReportState extends State<AddDailyReport> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  LatLng? currentLocation;
  var _hosplitalNameController = TextEditingController();
  var _dactorNameController = TextEditingController();
  var _hosplitalAddressController = TextEditingController();

  getCurrentLocation()async{

    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     setState(() {

     });

     currentLocation = LatLng(latitude: position.latitude, longitude: position.longitude);
  }

  @override
  void initState() {
    getCurrentLocation();
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
          "Add Daily Report",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
     body: SingleChildScrollView(
       child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/app_logo.png"),
                ),
                SizedBox(height: 50,),
                // GestureDetector(
                //   onTap: () {},
                //   child: Container(
                //     height: 45,
                //     width: MediaQuery.of(context).size.width,
                //     alignment: Alignment.centerLeft,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         border: Border.all(color: Colors.black)
                //     ),
                //     child: Container(
                //       width: MediaQuery.of(context).size.width / 1.4,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(50),
                //         color: Colors.white,
                //       ),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           SizedBox(width: 15,),
                //           Container(
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(50),
                //             ),
                //             alignment: Alignment.center,
                //             child: Icon(Icons.search,color: Colors.black,size: 23,),
                //             width: 25,
                //             height: 50,
                //           ),
                //
                //           Expanded(
                //             child: TextFormField(
                //               //  controller: searchController,
                //               onChanged: (val){
                //                 setState(() {});
                //               },
                //               decoration: InputDecoration(
                //                   border: InputBorder.none,
                //                   hintText: "Search....",
                //                   hintStyle: TextStyle(
                //                       color: Colors.grey,
                //                       fontSize: 17,
                //                       fontWeight: FontWeight.w500
                //                   )
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20.0),
                Flexible(
                  child: SingleChildScrollView(
                    child: SearchLocation(apiKey: "",onSelected: (Place place)async{
                      print("place ${place.description}",);
                      final geolocation = await place.geolocation;
                      print("coordinates ${geolocation?.coordinates}");
                      print("coordinates ${place.placeId}");
                      _hosplitalNameController.text = place.description.split(',').first??"";
                      _hosplitalAddressController.text = place.description;

                      setState(() {
                      });
                    },placeType: PlaceType.establishment,strictBounds: true,iconColor: Colors.black,country: "IN",
                    location: currentLocation,radius: 1000,placeholder: 'Search Hospital',),
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
                      controller: _hosplitalNameController,
                      onChanged: (val){
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Hospital Name*",
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
                      controller: _dactorNameController,
                      onChanged: (val){
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Doctor Name*",
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
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400,width: 1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                       controller: _hosplitalAddressController,
                      onChanged: (val){
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Address*",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          )
                      ),
                      maxLines: 3,
                    ),
                  ),
                ),


                SizedBox(height: 20,),
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
                        if(_hosplitalAddressController.text.isNotEmpty&&_hosplitalNameController.text.isNotEmpty&&_dactorNameController.text.isNotEmpty){
                          addDailyReport(context);
                        }else{
                          EasyLoading.showToast("All fields are required",
                              dismissOnTap: true,
                              duration: const Duration(seconds: 1),
                              toastPosition: EasyLoadingToastPosition.center);
                        }
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

  addDailyReport(BuildContext context)async{
    Map<String, dynamic> params = new Map<String, String>();
    params["doc_name"] = _dactorNameController.text;
    params["hospital_name"] = _hosplitalNameController.text;
    params["address"] = _hosplitalAddressController.text;

    Future.delayed(Duration.zero, () {
      showLoader(context);
    });

    await ApiRepo().addDailyReports(params, context);
  }

}