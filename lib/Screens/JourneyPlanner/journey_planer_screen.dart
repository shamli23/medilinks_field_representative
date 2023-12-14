import 'package:flutter/material.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/JourneyPlanner/add_journey_planer.dart';
import 'package:medilinks_doctor_app/Screens/JourneyPlanner/edit_journey_palnner.dart';

import '../../Constants/const_files.dart';
import '../../models/journey_planner_list_response.dart';
import '../../repository/api_repo.dart';

class JourneyPlannerScreen extends StatefulWidget {
  const JourneyPlannerScreen({Key? key}) : super(key: key);

  @override
  State<JourneyPlannerScreen> createState() => _JourneyPlannerScreenState();
}

class _JourneyPlannerScreenState extends State<JourneyPlannerScreen> {
  List<MeetingGroups> meetingList = [];
  List<MeetingGroups> searchMeetingList = [];
  var searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {

    fetchJourneyPlannerList();

    super.initState();
  }

  fetchJourneyPlannerList()async{
    Future.delayed(Duration.zero, () {
      showLoader(context);
    });
    var response = await ApiRepo().getJourneyPlannerList();

    if(response!=null){
      for(var data in response.meetingGroups!){
        meetingList.add(data);
        setState(() {

        });
      }
      Navigator.pop(context);
    }
  }


  _onChangeHandler(value )
  {
    if(value.isNotEmpty){
      isSearching = true;
      searchMeetingList.clear();
      setState(() {
      });
      searchJourneyPlanner(value);
    }else{
      isSearching = false;
      searchMeetingList.clear();
      setState(() {
      });
    }
  }

  searchJourneyPlanner(String query)async{

    searchMeetingList.clear();
    var response = await ApiRepo().searchJourneyPlannerList(query);
    if(response.meetingGroups != null){
      searchMeetingList.clear();
      setState(() {

      });
      for(var data in response.meetingGroups!){
        setState(() {
          searchMeetingList.add(data);
        });
      }
    }

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
                            controller: searchController,
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

              SizedBox(height: 20,),

             (isSearching? searchMeetingList.isNotEmpty:meetingList.isNotEmpty)?RefreshIndicator(
                onRefresh: (){
                  return Future.delayed(Duration(seconds: 1),
                          (){meetingList.clear();
                      fetchJourneyPlannerList();
                      }
                  );
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: isSearching?searchMeetingList.length:meetingList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          pushTo(context, EditJourneyPlaner(meetingList[index]));
                        },
                        child: Column(
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
                                  Container(
                                    width: 40,
                                    height:40,
                                    child: Image.asset("assets/images/user_profile.png",fit: BoxFit.contain),
                                  ),

                                  const SizedBox(width: 10,),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(isSearching?searchMeetingList[index].city.toString():meetingList[index].city.toString(),style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                           ),
                                          ),
                                         ),
                                        const SizedBox(height: 3,),
                                        Container(
                                          child: Text("${isSearching?searchMeetingList[index].fromDate.toString():meetingList[index].fromDate.toString()} To ${isSearching?searchMeetingList[index].toDate.toString():meetingList[index].toDate.toString()}",style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400
                                          ),
                                          ),
                                        ),

                                        const SizedBox(height: 3,),
                                        Container(
                                          child: Text("${isSearching?searchMeetingList[index].meetingCount.toString():meetingList[index].meetingCount.toString()} meetings",style: const TextStyle(
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
                        ),
                      );
                    }
                ),
              ):SizedBox.shrink(),

              const SizedBox(height: 60,),

            ],
          ),
        ),
      ),
    );
  }
}

