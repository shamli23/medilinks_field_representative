import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/LeaveApp/add_leave_app_form.dart';
import 'package:medilinks_doctor_app/Screens/Profile/profile_screen.dart';

//  Confirmed Pending

class LeaveApp extends StatefulWidget {
  const LeaveApp({Key? key}) : super(key: key);

  @override
  State<LeaveApp> createState() => _LeaveAppState();
}

class _LeaveAppState extends State<LeaveApp> {
  List<PatientModel> list = [];
  int showEdit = 0;
  int editIndex = 0;

  @override
  void initState() {

    PatientModel patientModel1 = new PatientModel(leaveType: "Single", startDate: "04-05-2023",endDate: "04-05-2023",status: "Confirmed",typeOfLeave : "Sick Leave");
    list.add(patientModel1);

    PatientModel patientModel2 = new PatientModel(leaveType: "Single", startDate: "04-05-2023",endDate: "04-05-2023",status: "Pending",typeOfLeave : "Casual Leave");
    list.add(patientModel2);

    PatientModel patientModel3 = new PatientModel(leaveType: "Multiple", startDate: "04-07-2023",endDate: "08-07-2023",status: "Confirmed",typeOfLeave : "Sick Leave");
    list.add(patientModel3);

    PatientModel patientModel4 = new PatientModel(leaveType: "Multiple", startDate: "02-08-2023",endDate: "04-08-2023",status: "Pending",typeOfLeave : "Casual Leave");
    list.add(patientModel4);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leadingWidth: 0,
        centerTitle: true,
        title:Container(
          child:  const Text("Leave App", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
          ),
        ),
        leading: Container(
          width: 0,
          height: 0,
        ),
        toolbarHeight: 60,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          pushTo(context, AddLeaveForm());
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: GestureDetector(
        onTap: (){
          showEdit = 0;
          editIndex = 0;
          setState(() {});
        },
        child: Container(
          height: size.height,
          color: Colors.white,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[

              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20,right: 20),
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

              SizedBox(height: 20,),

              ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            Container(
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const SizedBox(width: 3,),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Text(list[index].leaveType.toString(),style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500
                                                   ),
                                                 ),
                                               ),
                                             ),

                                            GestureDetector(
                                              onTap: ()
                                              {
                                               showEdit = 1;
                                               editIndex = index;

                                               setState(() {
                                               });
                                              },
                                              child: Container(
                                                width: 25,
                                                height:25,
                                                child: Image.asset("assets/images/option.png",fit: BoxFit.contain),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3,),
                                        Container(
                                          child: Text('${list[index].startDate} To ${list[index].endDate.toString()}',style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400
                                           ),
                                          ),
                                        ),
                                        const SizedBox(height: 3,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Text(list[index].typeOfLeave.toString(),style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w400
                                                 ),
                                                ),
                                               ),
                                              ),

                                            Container(
                                              padding: const EdgeInsets.only(bottom: 0,left: 5,right: 5, top: 0),
                                              height: 25,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                  color: HexColor("#fc7598"),
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              child: Text(list[index].status.toString(),style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400
                                              ),
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                             ],
                                            ),
                                           ],
                                         ),
                                       ),
                                      ],
                              ),
                            ),
                          ],
                        ),

                        showEdit == 1 && editIndex == index ? Positioned(
                            child: Container(
                              height: 70,
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                          GestureDetector(
                              onTap: ()
                              {
                                pushTo(context, AddLeaveForm());
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 25,
                                    height:25,
                                    child: Image.asset("assets/images/view.png",fit: BoxFit.contain),
                                  ),

                                  Text(" View",style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                ],
                              ),
                          ),
                                  SizedBox(height: 5,),

                                GestureDetector(
                                  onTap: ()
                                  {
                                    pushTo(context, AddLeaveForm());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 25,
                                        height:25,
                                        child: Image.asset("assets/images/edit.png",fit: BoxFit.contain),
                                      ),
                                      Text(" Edit",style:  TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.w400
                                      ),
                                      ),
                                    ],
                                  ),
                                ),

                                  SizedBox(height: 10,),
                        ],),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          top: 20,
                            right: 30,
                        ) : Container(height: 0,)
                      ],
                    );
                  }
              ),
              const SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );
  }
}



class PatientModel {
  String? leaveType;
  String? startDate;
  String? endDate;
  String? status;
  String? remark;
  String? typeOfLeave;

  PatientModel({this.leaveType, this.startDate, this.endDate, this.status, this.remark,this.typeOfLeave});
}