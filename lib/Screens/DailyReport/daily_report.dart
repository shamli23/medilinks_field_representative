import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/DailyReport/add_daily_report.dart';
import 'package:medilinks_doctor_app/Screens/LeaveApp/add_leave_app_form.dart';
import 'package:medilinks_doctor_app/Screens/Profile/profile_screen.dart';
import 'package:search_map_location/utils/google_search/place.dart';
import 'package:search_map_location/widget/search_widget.dart';

import '../../Constants/const_files.dart';
import '../../models/daily_reports_response.dart';
import '../../repository/api_repo.dart';

class DailyReport extends StatefulWidget {
  const DailyReport({Key? key}) : super(key: key);

  @override
  State<DailyReport> createState() => _DailyReportState();
}

class _DailyReportState extends State<DailyReport> {
    List<DailyReports> dailyReports = [];
    var _serchText = TextEditingController();

    @override
    void initState() {
      fetchDailyReportsList("");

      super.initState();
    }

    fetchDailyReportsList(String query)async{
      Future.delayed(Duration.zero, () {
        showLoader(context);
      });
      var response = await ApiRepo().getDailyReports(query);
      dailyReports.clear();
      if(response!=null){
        for(var data in response.dailyReports!){
          dailyReports.add(data);
          setState(() {

          });
        }
        Navigator.pop(context);
      }
    }
    fetchSearchDailyReportsList(String query)async{

      var response = await ApiRepo().getDailyReports(query);
      dailyReports.clear();
      if(response!=null){
        for(var data in response.dailyReports!){
          dailyReports.add(data);
          setState(() {

          });
        }
      }
    }


    _onChangeHandler(value )
    {
      if(value.isNotEmpty){
        dailyReports.clear();
        setState(() {
        });
        fetchSearchDailyReportsList(value);
      }else{
        dailyReports.clear();
        setState(() {
        });
        fetchDailyReportsList('');
      }
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
            child: const Text("Daily Report", style: TextStyle(
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
            pushTo(context, AddDailyReport());
          },
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
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
                            controller: _serchText,
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

              Flexible(
                child: RefreshIndicator(
                  onRefresh: (){
                    return Future.delayed(Duration(seconds: 1),
                            (){dailyReports.clear();
                        fetchDailyReportsList("");
                        }
                    );
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dailyReports.length,
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

                                  const SizedBox(width: 5,),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(dailyReports[index].hospitalName.toString(),style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                          ),
                                          ),
                                        ),
                                        const SizedBox(height: 3,),
                                        Container(
                                          child: Text(dailyReports[index].docName.toString(),style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400
                                          ),
                                          ),
                                        ),

                                        const SizedBox(height: 3,),
                                        Container(
                                          child: Text(DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.parse(dailyReports[index].createdAt.toString())).toString(),style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400
                                          ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 5,),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ),

      );
    }
  }
