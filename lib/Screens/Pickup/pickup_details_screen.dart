import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/Pickup/pickup_screen.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';
import 'package:medilinks_doctor_app/repository/api_repo.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../models/pickup_list_response.dart';


class PickupsDetailsScreen extends StatefulWidget {
   PickupsDetailsScreen( this.pickupData);

  PickupData? pickupData;

  @override
  State<PickupsDetailsScreen> createState() => _PickupsDetailsScreenState();
}

class _PickupsDetailsScreenState extends State<PickupsDetailsScreen> {

  final GlobalKey globalKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.appColor,
        leadingWidth: 45,
        elevation: 0,
        leading: GestureDetector(
          onTap: ()
          {
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
        title: const Text(
          "Pickup Details",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10, top: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey[100]!,
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 30,),

              Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/images/user_profile.png",fit: BoxFit.cover,height: 100,width: 100,)
                  )
              ),





              Container(
                margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10, top: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:  Text("Booking id : ${widget.pickupData?.sampleBookingId}",style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                       ),
                      ),
                     ),

                    SizedBox(height: 10,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:  Text("Patient Name : ${widget.pickupData?.name}",style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:  Text("Specimen Location: ${widget.pickupData?.specimenInformationLocationOfSpecimen}",style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        ),
                      ),
                    ),


                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:  Text("Specimen Contact: ${widget.pickupData?.specimenInformationPhone}",style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:  Text("Test Name : ${widget.pickupData?.recurrenceScore}",style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        ),
                      ),
                    ),


                    SizedBox(height: 10,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:  Text("Location : ${widget.pickupData?.streetAddressCity}",style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child:  Text("Booking Date : ${DateFormat("dd-MM-yyyy").format(DateTime.parse(widget.pickupData?.createdAt??"")).toString()}",style:  TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                  ],
                ),
              ),

              SizedBox(height: 30,),


              widget.pickupData?.sampleStatus=="Sample Collected"?SizedBox.shrink():Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      "Sample Collected",
                      style:  const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    updateSampleCollected(widget.pickupData?.sampleBookingId.toString()??"",widget.pickupData?.sampleStatus??"",widget.pickupData?.userId.toString()??"");
                                     },
                ),
              ),

              widget.pickupData?.sampleStatus=="Sample Collected"?SizedBox.shrink():SizedBox(height: 20,),


              widget.pickupData?.sampleStatus=="Sample Collected"?SizedBox.shrink():Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(59, 10, 59, 10),
                    child: Text(
                      "Print Barcode",
                      style:  const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () async{

                    Uint8List  image = await screenshotController.captureFromWidget(barcode());
                    print("image ${image.length}");
                    var result = await ImageGallerySaver.saveImage(image);
                    print("result ${result}");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget barcode(){
    return Screenshot(
      controller: screenshotController,
      child: SfBarcodeGenerator(
        backgroundColor: Colors.white,
        value: 'www.syncfusion.com',
        symbology: Code128C(),
        showValue: true,
      ),
    );
}

updateSampleCollected(String sample_booking_id,String sample_status,String user_id)async{

  Map<String, String> params = new Map<String, String>();
  params["sample_booking_id"] = sample_booking_id;
  params["sample_status"] = "Sample Collected";
  params["user_id"] = user_id;
  var response =   await ApiRepo().updateCollectedStatusList(context, params);

}



}
