import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import 'package:medilinks_doctor_app/common/theme_helper.dart';


class PickupsDetailsScreen extends StatefulWidget {
  const PickupsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PickupsDetailsScreen> createState() => _PickupsDetailsScreenState();
}

class _PickupsDetailsScreenState extends State<PickupsDetailsScreen> {
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
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,bottom: 10, top: 10),
        padding: const EdgeInsets.all(10),
        height: 450,
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
                    child: const Text("Booking id : 056AS467",style:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                     ),
                    ),
                   ),

                  SizedBox(height: 10,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Text("Patient Name : David",style:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Text("Location : Ghatkoper, Mumbai",style:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Text("Pickup Date : 27-04-2023",style:  TextStyle(
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

            Container(
              decoration: ThemeHelper().buttonBoxDecoration(context),
              child: ElevatedButton(
                style: ThemeHelper().buttonStyle(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: Text(
                    "Print Barcode",
                    style:  const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
