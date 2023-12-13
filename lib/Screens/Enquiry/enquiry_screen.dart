import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/Enquiry/add_enquiry.dart';
import 'package:medilinks_doctor_app/Screens/Enquiry/edit_enquiry.dart';
import 'package:medilinks_doctor_app/Screens/Profile/profile_screen.dart';
import 'package:medilinks_doctor_app/models/enquiry_list_response.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';
import '../../repository/api_repo.dart';


class EnquiryScreen extends StatefulWidget {
  const EnquiryScreen({Key? key}) : super(key: key);

  @override
  State<EnquiryScreen> createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {

  List<Enquiries> enquiries = [];
  List<Enquiries> searchEnquiries = [];
  bool isSearching = false;
  var _searchText = TextEditingController();

  fetchEnquiryList()async{
    Future.delayed(Duration.zero, () {
      showLoader(context);
    });
    var response = await ApiRepo().getEnquiryList();

    if(response!=null){
      for(var data in response.enquiries!){
        enquiries.add(data);
        setState(() {

        });
      }
      Navigator.pop(context);
    }
  }

  @override
  void initState() {

    fetchEnquiryList();

    super.initState();
  }

  _onChangeHandler(value )
  {
    if(value.isNotEmpty){
      isSearching = true;
      searchEnquiries.clear();
      setState(() {
      });
      searchEnquiriesList(value);
    }else{
      isSearching = false;
      searchEnquiries.clear();
      setState(() {
      });
    }
  }

  searchEnquiriesList(String query)async{
    Map<String, String> params = new Map<String, String>();
    params["query"] = query;
    searchEnquiries.clear();
    var response = await ApiRepo().searchEnquiry(context, params);
    if(response.enquiries != null){
      searchEnquiries.clear();
      setState(() {

      });
      for(var data in response.enquiries!){
        setState(() {
          searchEnquiries.add(data);
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
        centerTitle: true,
        leading: Container(
          width: 0,
          height: 0,
        ),
        title:Container(
          child: const Text("Enquiry", style: TextStyle(
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
          pushTo(context, AddEnquiry());
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

            SizedBox(height: 20,),

            (isSearching?searchEnquiries.isNotEmpty:enquiries.isNotEmpty)?Flexible(
              child: RefreshIndicator(
                onRefresh: (){
                  return Future.delayed(Duration(seconds: 1),
                      (){enquiries.clear();
                    fetchEnquiryList();
                      }
                  );
                },
                child: ListView.builder(
                    itemCount: isSearching?searchEnquiries.length:enquiries.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          pushTo(context, EditEnquiry(isSearching?searchEnquiries[index]:enquiries[index]));
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

                                  const SizedBox(width: 5,),

                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(isSearching?searchEnquiries[index].doctorName.toString():enquiries[index].doctorName.toString(),style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500
                                           ),
                                          ),
                                         ),
                                        const SizedBox(height: 3,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Text(isSearching?searchEnquiries[index].testName.toString():enquiries[index].testName.toString(),style: const TextStyle(
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
                                              width: 120,
                                              alignment: Alignment.center,
                                              child: Text(isSearching?searchEnquiries[index].city.toString():enquiries[index].city.toString(),style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Text(isSearching?searchEnquiries[index].source.toString():enquiries[index].source.toString(),style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w400
                                                ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:EdgeInsets.only(right: 17),
                                              child: Container(
                                                child: Text(DateFormat('dd-MM-yyyy').format(DateTime.parse(isSearching?searchEnquiries[index].createdAt.toString():enquiries[index].createdAt.toString())),style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w400
                                                ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3,),

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
                ),
              ),
            ):SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}


