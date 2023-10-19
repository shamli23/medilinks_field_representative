import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medilinks_doctor_app/Constants/const_files.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationList> list = [];
  String? nextNumber = '1';
  ScrollController _shopScrollController = ScrollController();
  int loader_paggination = 0;
  int callPagination = 0;

  @override
  void initState() {
    super.initState();

    var notificationList1 = NotificationList(message: 'Your medical test "Oncotype Dx Breast DCIS Score" has been successfully booked.',description: "", readFlag: "0");
    list.add(notificationList1);

    var notificationList2 = NotificationList(message: 'Your medical test "Oncotype Dx Breast DCIS Score" has been successfully booked.',description: "", readFlag: "0");
    list.add(notificationList2);

    var notificationList3 = NotificationList(message: 'Your medical test "Oncotype Dx Breast DCIS Score" has been successfully booked.',description: "", readFlag: "1");
    list.add(notificationList3);

    var notificationList4 = NotificationList(message: 'Your medical test "Oncotype Dx Breast DCIS Score" has been successfully booked.',description: "", readFlag: "1");
    list.add(notificationList4);

  }


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.appColor,
        leadingWidth: 45,
        elevation: 0,
        leading: GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(left: 15,top: 15,bottom: 15),
            child: Image.asset("assets/images/back_button.png", color: Colors.white,),
          ),
        ),
        title: const Text("Notifications",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color:Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        color: Colors.white,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.only(bottom: 80),
            controller: _shopScrollController,
            itemBuilder: (context, index)
            {
              final dateTimeString = "2023-08-06T13:29:15.000000Z";
              final dateTime = parseDateTime(dateTimeString);

              final dateOnly = extractDate(dateTimeString);

              return Container(
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 10, top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey[100]!,
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.notifications),
                    ),

                    SizedBox(width: 10,),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text("${list[index].message.toString() != "" ? list[index].message.toString() : ""}",style: TextStyle(
                                fontSize: 16,
                                color: list[index].readFlag.toString() == "1" ? Colors.black54 : Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text("${dateOnly}",style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text("${formatTime(dateTime)}",style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                                padding: EdgeInsets.only(bottom: 5,left: 5,right: 5, top: 4),
                                height: 25,
                                alignment: Alignment.center,
                              ),
                            ],
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
    );
  }


  String extractDate(String isoDateTimeString) {
    // Extract the date portion (YYYY-MM-DD) from the ISO 8601 string
    return isoDateTimeString.split('T').first;
  }


  DateTime parseDateTime(String dateTimeString) {
    return DateTime.parse(dateTimeString).toLocal();
  }

  String formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime); // Formats time (e.g., 1:29 PM)
  }
}



class NotificationList {
  String? message;
  String? description;
  String? readFlag;

   NotificationList({this.message, this.description, this.readFlag});
}

