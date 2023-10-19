import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/Notification/notifications.dart';
import 'package:medilinks_doctor_app/Screens/Pickup/pickup_details_screen.dart';
import 'package:medilinks_doctor_app/Screens/Profile/profile_screen.dart';


class PickupScreen extends StatefulWidget {
  const PickupScreen({Key? key}) : super(key: key);

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  List<PatientModel> list = [];
  var _searchText = TextEditingController();

  @override
  void initState() {

    PatientModel patientModel1 = new PatientModel(patientName: "Patient Name", date: "04-05-2023",caseHistory: "Mumbai",status: "Booked Test");
    list.add(patientModel1);

    PatientModel patientModel2 = new PatientModel(patientName: "Patient Name", date: "04-05-2023",caseHistory: "Mumbai",status: "In Transit");
    list.add(patientModel2);

    PatientModel patientModel3 = new PatientModel(patientName: "Patient Name", date: "04-05-2023",caseHistory: "Mumbai",status: "Sample Collected");
    list.add(patientModel3);

    PatientModel patientModel4 = new PatientModel(patientName: "Patient Name", date: "04-05-2023",caseHistory: "Mumbai",status: "Download Report");
    list.add(patientModel4);

    super.initState();
  }

  _onChangeHandler(value ) {
    // const duration = Duration(milliseconds:400); // set the duration that you want call search() after that.
    // if (searchOnStoppedTyping != null) {
    //   setState(() => searchOnStoppedTyping!.cancel()); // clear timer
    // }
    // setState(() => searchOnStoppedTyping = new Timer(duration, () => search(value)));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leadingWidth: 0,
        leading: Container(width: 0,),
        centerTitle: false,
        title:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: ()
                  {
                    pushTo(context, ProfileScreen());
                  },
                  child: Container(
                    height: 50,
                    child: Image.asset("assets/images/profile.png",fit: BoxFit.contain),
                  ),
                ),

                SizedBox(width: 5,),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Hi  Sam,", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                        height: 40,
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: ()
                  {
                    pushTo(context, NotificationsScreen());
                  },
                  child: Container(
                    height: 30,
                    child: Image.asset("assets/images/bell.png",fit: BoxFit.contain),
                  ),
                )
              ],
            ),


            SizedBox(height: 10,),

            GestureDetector(
              onTap: ()
              {},
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width,
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
                          controller: _searchText,
                          onChanged: _onChangeHandler,
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
          ],
        ),
        toolbarHeight: 130,
      ),
      body: Container(
        height: size.height,
        color: Colors.white,
        margin: const EdgeInsets.only(top: 10),
        child: Stack(
          children: <Widget>[

            ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  if(index == 0)
                  {
                    return GestureDetector(
                      onTap: (){
                        pushTo(context, const PickupsDetailsScreen());
                      },
                      child: Column(
                        children: [

                          const SizedBox(height: 15,),

                          Container(
                            width: size.width,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 30),
                            child: const Text("Find Your Pickups", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                            ),
                          ),


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

                                const SizedBox(width: 5,),

                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(list[index].patientName.toString(),style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500
                                        ),
                                        ),
                                      ),
                                      const SizedBox(height: 3,),
                                      Container(
                                        child: Text(list[index].caseHistory.toString(),style: const TextStyle(
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
                                              child: Text(list[index].date.toString(),style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w400
                                              ),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            child: Text(list[index].status.toString(),style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: HexColor("#fc7598"),
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            padding: EdgeInsets.only(bottom: 5,left: 5,right: 5, top: 4),
                                            height: 25,
                                            width: 150,
                                            alignment: Alignment.center,

                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 5,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  else
                  {
                    return GestureDetector(
                      onTap: (){
                        pushTo(context, const PickupsDetailsScreen());
                      },
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(width: 5,),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(list[index].patientName.toString(),style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500
                                    ),
                                    ),
                                  ),
                                  const SizedBox(height: 3,),
                                  Container(
                                    child: Text(list[index].caseHistory.toString(),style: const TextStyle(
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
                                          child: Text(list[index].date.toString(),style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400
                                            ),
                                          ),
                                         ),
                                        ),

                                      Container(
                                        decoration: BoxDecoration(
                                            color: HexColor("#fc7598"),
                                            borderRadius: BorderRadius.circular(8)
                                        ),
                                        padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5, top: 4),
                                        height: 25,
                                        width: 150,
                                        alignment: Alignment.center,
                                        child: Text(list[index].status.toString(),style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 5,),
                          ],
                        ),
                      ),
                    );
                  }
                }
            ),
            const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}



class PatientModel {
  String? patientName;
  String? date;
  String? caseHistory;
  String? status;

  PatientModel({this.patientName, this.date, this.caseHistory, this.status});
}