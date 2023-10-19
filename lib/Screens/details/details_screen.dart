import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.backgroundColor,
        elevation: 0,
        leadingWidth: 50,
        leading: GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(left: 15,top: 8,bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,size: 20,),
          ),
        ),
        title: Container(
          child: Text("Pickup Details",style: TextStyle(
              color: ConstColor.appColor,
              fontSize: 25,
              fontWeight: FontWeight.w500
           ),
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ConstColor.backgroundColor,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              child: Text("John Martin",style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500
                ),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              child: Text("Mobile Number : 1234567890",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            SizedBox(height: 20,),

            Container(
              child: Text("Address : Ghatkoper / Mumbai",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),


            SizedBox(height: 20,),

            Container(
              child: const Text("Status : Booked Test",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),

            SizedBox(height: 100,),

            Container(
              width: 150,
              child: Image.asset("assets/images/barcode.png",fit: BoxFit.cover,),
            ),


            SizedBox(height: 100,),

            Container(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              decoration: BoxDecoration(
                color: ConstColor.appColor,
                borderRadius: BorderRadius.circular(15)
              ),
              alignment: Alignment.center,
              child: Text("Print",style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
