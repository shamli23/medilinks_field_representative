import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/DailyReport/daily_report.dart';
import 'package:medilinks_doctor_app/Screens/Enquiry/enquiry_screen.dart';
import 'package:medilinks_doctor_app/Screens/JourneyPlanner/journey_planer_screen.dart';
import 'package:medilinks_doctor_app/Screens/LeaveApp/leave_app.dart';
import 'package:medilinks_doctor_app/Screens/Pickup/pickup_screen.dart';


class DashBoard extends StatefulWidget {
  int currentIndex;
  DashBoard({Key? key,required this.currentIndex}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String profileImage = "";

  final List _children =
  [
    const PickupScreen(),
    const EnquiryScreen(),
    const DailyReport(),
    const LeaveApp(),
    const JourneyPlannerScreen(),
  ];

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if(widget.currentIndex == 0)
        {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  title: Text("Exit?",style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  content: Text("Are you sure you want to exit?",style: TextStyle(
                      fontSize: 18,
                      color: Colors.black
                  ),),
                  actions: <Widget>[

                    GestureDetector(
                      onTap: ()
                      {
                        exit(0);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 0,left: 5,right: 5, top: 4),
                        height: 35,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: HexColor("#e12454"),
                            borderRadius: BorderRadius.circular(8)
                        ),

                        child: Text("Ok",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 0,left: 5,right: 5, top: 4),
                        height: 35,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: HexColor("#e12454"),
                            borderRadius: BorderRadius.circular(8)
                        ),

                        child: Text("Cancel",style: TextStyle(
                            color: Colors.white
                        ),),
                      ),
                    )


                  ],
                );
              }
          );
        }
        else
        {
          replaceRoute(context, DashBoard(currentIndex: 0));
        }

        return Future.value(true);
      },
      child: Scaffold(
          body: _children[widget.currentIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: widget.currentIndex,
          backgroundColor: Theme.of(context).primaryColor,
          onItemSelected: (index){
            setState(() {
              widget.currentIndex = index;
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Container(
                margin: EdgeInsets.only(left: 5),
                       child: Image.asset("assets/images/delivery_truck.png",height: 30,width: 27,color: Colors.white,)
                 ,),
              title: Text('Pickup'),

            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Container(
                margin: EdgeInsets.only(left: 5),
                   child: Image.asset("assets/images/question.png",height: 30,width: 27,color: Colors.white,)
                ,),
              title: Text('Enquiry'),
            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Container(
                margin: EdgeInsets.only(left: 0),
                 child: Image.asset("assets/images/health_check.png",height: 33,width: 27,color: Colors.white,)
                ,),
              title: Text('Daily Report',style: TextStyle(
                fontSize: 14
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Container(
                margin: EdgeInsets.only(left: 5,top: 3),
                  child: Image.asset("assets/images/leave.png",height: 35,width: 27,color: Colors.white,)
                  ,),
              title: Text('Leave App'),
            ),
            BottomNavyBarItem(
              activeColor: Colors.white,
              icon: Container(
                margin: EdgeInsets.only(left: 5),
                child: Image.asset("assets/images/journey.png",height: 30,width: 27,color: Colors.white,)
                ,),
              title: Text('Journey Planner'),
            ),
          ],
        ),
      ),
    );
  }
}

extension HelpingMwthod on _DashBoardState {
  void onTabTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }
}
