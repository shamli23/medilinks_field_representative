import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/Notification/notifications.dart';
import 'package:medilinks_doctor_app/Screens/Pickup/pickup_details_screen.dart';
import 'package:medilinks_doctor_app/Screens/Profile/profile_screen.dart';
import 'package:medilinks_doctor_app/models/pickup_list_response.dart';
import 'package:medilinks_doctor_app/repository/api_repo.dart';

import '../../Constants/const_files.dart';


class PickupScreen extends StatefulWidget {
  const PickupScreen({Key? key}) : super(key: key);

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  var _searchText = TextEditingController();

  List<PickupData> pickupData = [];
  List<PickupData> collectedData = [];
  List<PickupData> searchPickupData = [];
  List<PickupData> searchCollectedData = [];
  bool isSearching = false;

  fetchPickupList()async{
    Future.delayed(Duration.zero, () {
      showLoader(context);
    });
   var response = await ApiRepo().getPickupList();

   if(response!=null){
     for(var data in response.data!){
       pickupData.add(data);
       setState(() {

       });
     }
     Navigator.pop(context);
   }
  }

  fetchCollectedList()async{
    Future.delayed(Duration.zero, () {
      showLoader(context);
    });
   var response = await ApiRepo().getCollectedList();

   if(response!=null){
     for(var data in response.data!){
       collectedData.add(data);
       setState(() {

       });
     }
     Navigator.pop(context);
   }
  }

  @override
  void initState() {

    fetchPickupList();
    fetchCollectedList();

    super.initState();
  }

  _onChangeHandler(value )
  {
    if(value.isNotEmpty){
      isSearching = true;
      searchPickupData.clear();
      setState(() {
      });
      searchPickupSamples(value);
    }else{
      isSearching = false;
      searchPickupData.clear();
      setState(() {
      });
    }
  }

  searchPickupSamples(String query)async{
    Map<String, String> params = new Map<String, String>();
    params["query"] = query;
    searchPickupData.clear();
    var response = await ApiRepo().searchPickupSamples(context, params);
    if(response.data != null){
      searchPickupData.clear();
      setState(() {

      });
      for(var data in response.data!){
        setState(() {
          searchPickupData.add(data);
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            indicatorColor: Colors.white,
              tabs: [
            Tab(text: "Pickup",),
            Tab(text: "Collected",),
          ]),
        ),
        body: TabBarView(
          children: [
            RefreshIndicator(
              onRefresh: (){
                return Future.delayed(Duration(seconds: 1),
                        (){
                  pickupData.clear();
                    fetchPickupList();
                    }
                );
              },
              child: Container(
                height: size.height,
                color: Colors.white,
                margin: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: <Widget>[

                    (isSearching?searchPickupData.isNotEmpty:pickupData.isNotEmpty)?ListView.builder(
                        shrinkWrap: true,
                        itemCount: isSearching?searchPickupData.length:pickupData.length,
                        itemBuilder: (context, index) {
                          if(index == 0)
                          {
                            return GestureDetector(
                              onTap: (){
                                pushTo(context,  PickupsDetailsScreen(isSearching?searchPickupData[index]:pickupData[index]));
                              },
                              child: Column(
                                children: [

                                  const SizedBox(height: 15,),

                                  Container(
                                    width: size.width,
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(left: 30),
                                    child: const Text("Your Pickups", style: TextStyle(
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
                                                child: Text(isSearching?searchPickupData[index].name.toString():pickupData[index].name.toString(),style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                ),
                                              ),
                                              const SizedBox(height: 3,),
                                              Container(
                                                child: Text(isSearching?searchPickupData[index].streetAddressCity.toString():pickupData[index].streetAddressCity.toString(),style: const TextStyle(
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
                                                      child: Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(isSearching?searchPickupData[index].createdAt.toString():pickupData[index].createdAt??"")).toString(),style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                      ),
                                                    ),
                                                  ),

                                                  Container(
                                                    child: Text(isSearching?searchPickupData[index].sampleStatus.toString():pickupData[index].sampleStatus.toString(),style: TextStyle(
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
                                pushTo(context,  PickupsDetailsScreen(isSearching?searchPickupData[index]:pickupData[index]));
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
                                            child: Text(isSearching?searchPickupData[index].name.toString():pickupData[index].name.toString(),style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500
                                            ),
                                            ),
                                          ),
                                          const SizedBox(height: 3,),
                                          Container(
                                            child: Text(isSearching?searchPickupData[index].streetAddressCity.toString():pickupData[index].streetAddressCity.toString(),style: const TextStyle(
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
                                                  child: Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(isSearching?searchPickupData[index].createdAt.toString():pickupData[index].createdAt??"")).toString(),style: const TextStyle(
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
                                                child: Text(isSearching?searchPickupData[index].sampleStatus.toString():pickupData[index].sampleStatus.toString(),style: const TextStyle(
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
                    ):SizedBox.shrink(),
                    const SizedBox(height: 60,),
                  ],
                ),
              ),
            ),
            RefreshIndicator(
              onRefresh: (){
                return Future.delayed(Duration(seconds: 1),
                        (){
                      collectedData.clear();
                      fetchCollectedList();
                    }
                );
              },
              child: Container(
                height: size.height,
                color: Colors.white,
                margin: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: <Widget>[

                    collectedData.isNotEmpty?ListView.builder(
                        shrinkWrap: true,
                        itemCount: collectedData.length,
                        itemBuilder: (context, index) {
                          if(index == 0)
                          {
                            return GestureDetector(
                              onTap: (){
                                pushTo(context,  PickupsDetailsScreen(collectedData[index]));
                              },
                              child: Column(
                                children: [

                                  const SizedBox(height: 15,),

                                  Container(
                                    width: size.width,
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(left: 30),
                                    child: const Text("Collected Samples", style: TextStyle(
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
                                                child: Text(collectedData[index].name.toString(),style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                ),
                                              ),
                                              const SizedBox(height: 3,),
                                              Container(
                                                child: Text(collectedData[index].streetAddressCity.toString(),style: const TextStyle(
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
                                                      child: Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(collectedData[index].createdAt??"")).toString(),style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                      ),
                                                    ),
                                                  ),

                                                  Container(
                                                    child: Text(collectedData[index].sampleStatus.toString(),style: TextStyle(
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
                                pushTo(context,  PickupsDetailsScreen(collectedData[index]));
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
                                            child: Text(collectedData[index].name.toString(),style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500
                                            ),
                                            ),
                                          ),
                                          const SizedBox(height: 3,),
                                          Container(
                                            child: Text(collectedData[index].streetAddressCity.toString(),style: const TextStyle(
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
                                                  child: Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(collectedData[index].createdAt??"")).toString(),style: const TextStyle(
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
                                                child: Text(collectedData[index].sampleStatus.toString(),style: const TextStyle(
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
                    ):SizedBox.shrink(),
                    const SizedBox(height: 60,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
