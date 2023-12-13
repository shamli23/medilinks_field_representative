import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/LeaveApp/add_leave_app_form.dart';
import 'package:medilinks_doctor_app/Screens/LeaveApp/edit_leave_form.dart';
import 'package:medilinks_doctor_app/models/leave_list_response.dart';
import '../../Constants/const_files.dart';
import '../../repository/api_repo.dart';

//  Confirmed Pending

class LeaveApp extends StatefulWidget {
  const LeaveApp({Key? key}) : super(key: key);

  @override
  State<LeaveApp> createState() => _LeaveAppState();
}

class _LeaveAppState extends State<LeaveApp> {
  List<Leaves> leaveList = [];
  List<Leaves> searchLeaveList = [];
  bool isSearching = false;
  var searchController = TextEditingController();


  @override
  void initState() {

    fetchLeaveList();

    super.initState();
  }

  _onChangeHandler(value )
  {
    if(value.isNotEmpty){
      isSearching = true;
      searchLeaveList.clear();
      setState(() {
      });
      fetchSearchLeaveList(value);
    }else{
      isSearching = false;
      searchLeaveList.clear();
      setState(() {
      });
    }
  }

  fetchSearchLeaveList(String query)async{
    Map<String, String> params = new Map<String, String>();
    params["query"] = query;
    searchLeaveList.clear();
    var response = await ApiRepo().searchLeave(context, params);
    if(response.leaves != null){
      searchLeaveList.clear();
      setState(() {

      });
      for(var data in response.leaves!){
        setState(() {
          searchLeaveList.add(data);
        });
      }
    }

  }


  fetchLeaveList()async{
    Future.delayed(Duration.zero, () {
      showLoader(context);
    });
    var response = await ApiRepo().getLeaveList();

    if(response!=null){
      for(var data in response.leaves!){
        leaveList.add(data);
        setState(() {

        });
      }
      Navigator.pop(context);
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
          child:  const Text("Leave Application", style: TextStyle(
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

              (isSearching?searchLeaveList.isNotEmpty:leaveList.isNotEmpty)?Flexible(
                child: RefreshIndicator(
                  onRefresh: (){
                    return Future.delayed(Duration(seconds: 1),
                            (){leaveList.clear();
                        fetchLeaveList();
                        }
                    );
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: isSearching?searchLeaveList.length:leaveList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            pushTo(context, EditLeaveForm(isSearching?searchLeaveList[index]:leaveList[index]));
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

                                    const SizedBox(width: 3,),

                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(isSearching?searchLeaveList[index].typeOfLeave.toString():leaveList[index].typeOfLeave.toString(),style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500
                                               ),
                                             ),
                                           ),
                                          const SizedBox(height: 5,),
                                          Container(
                                            child:( isSearching?searchLeaveList[index].oneDayDate== null:leaveList[index].oneDayDate == null)?Text('${isSearching?searchLeaveList[index].fromDate:leaveList[index].fromDate} To ${isSearching?searchLeaveList[index].toDate:leaveList[index].toDate.toString()}',style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w400
                                             ),
                                            ):Text('${isSearching?searchLeaveList[index].oneDayDate:leaveList[index].oneDayDate}',style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w400
                                            ),
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Text(isSearching?searchLeaveList[index].typeOfLeave.toString():leaveList[index].typeOfLeave.toString(),style: const TextStyle(
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
                                                child: Text(isSearching?searchLeaveList[index].status.toString():leaveList[index].status.toString(),style: const TextStyle(
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
                        );
                      }
                  ),
                ),
              ):SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
