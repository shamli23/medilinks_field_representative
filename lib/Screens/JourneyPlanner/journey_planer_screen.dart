import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/JourneyPlanner/add_journey_planer.dart';
import 'package:medilinks_doctor_app/Screens/Profile/profile_screen.dart';

class JourneyPlannerScreen extends StatefulWidget {
  const JourneyPlannerScreen({Key? key}) : super(key: key);

  @override
  State<JourneyPlannerScreen> createState() => _JourneyPlannerScreenState();
}

class _JourneyPlannerScreenState extends State<JourneyPlannerScreen> {
  List<PatientModel> list = [];

  @override
  void initState() {

    PatientModel patientModel1 = new PatientModel(doctorName: "Doctor Name", date: "04-05-2023 To 06-05-2023",city: "Mumbai",source: "Source",testName: "Thyroid panel");
    list.add(patientModel1);

    PatientModel patientModel2 = new PatientModel(doctorName: "Doctor Name", date: "04-05-2023 To 06-05-2023",city: "Mumbai",source: "Source",testName: "Thyroid panel");
    list.add(patientModel2);

    PatientModel patientModel3 = new PatientModel(doctorName: "Doctor Name", date: "04-05-2023 To 06-05-2023",city: "Mumbai",source: "Source",testName: "Thyroid panel");
    list.add(patientModel3);

    PatientModel patientModel4 = new PatientModel(doctorName: "Doctor Name", date: "04-05-2023 To 06-05-2023",city: "Mumbai",source: "Source",testName: "Thyroid panel");
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
        leading: Container(
          width: 0,
          height: 0,
        ),
        centerTitle: true,
        title:Container(
          child: const Text("Journey Planner", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white
           ),
          ),
         ),
        toolbarHeight: 60,
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          pushTo(context, AddJourneyPlaner());
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        height: size.height,
        color: Colors.white,
        margin: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
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
                    return Column(
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
                              GestureDetector(
                                onTap: ()
                                {

                                },
                                child: Container(
                                  width: 40,
                                  height:40,
                                  child: Image.asset("assets/images/user_profile.png",fit: BoxFit.contain),
                                ),
                              ),

                              const SizedBox(width: 10,),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(list[index].city.toString(),style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                       ),
                                      ),
                                     ),
                                    const SizedBox(height: 3,),
                                    Container(
                                      child: Text(list[index].date.toString(),style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400
                                      ),
                                      ),
                                    ),

                                    const SizedBox(height: 3,),
                                    Container(
                                      child: Text(list[index].doctorName.toString(),style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
  String? doctorName;
  String? testName;
  String? source;
  String? city;
  String? date;

  PatientModel({this.doctorName, this.testName, this.source, this.city, this.date});
}