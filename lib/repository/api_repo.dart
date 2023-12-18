import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medilinks_doctor_app/Constants/screennavigation.dart';
import 'package:medilinks_doctor_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:medilinks_doctor_app/Screens/Login/login_page.dart';
import 'package:medilinks_doctor_app/models/daily_reports_response.dart';
import 'package:medilinks_doctor_app/models/enquiry_list_response.dart';
import 'package:medilinks_doctor_app/models/leave_list_response.dart';
import 'package:medilinks_doctor_app/models/login_response.dart';
import 'package:medilinks_doctor_app/models/medical_test_response.dart';
import 'package:medilinks_doctor_app/models/pickup_list_response.dart';
import 'package:http/http.dart'as http;
import '../Constants/api_urls.dart';
import '../Screens/VerificationOtp/forgot_password_verification_page.dart';
import '../models/journey_planner_list_response.dart';
import 'package:medilinks_doctor_app/Constants/prefs_manager.dart';
 const  accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWR2YW5jZW1lZGlsaW5rcy5jb21cL2FwaVwvZmllbGQtcmVwcmVzZW50YXRpdmUtbG9naW4iLCJpYXQiOjE3MDI4Nzg2NDAsImV4cCI6MTcwMjg4MjI0MCwibmJmIjoxNzAyODc4NjQwLCJqdGkiOiJtaUR6V1YwZXdKVXlOM0pXIiwic3ViIjoxNzIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.XPsa7ctT2lM9_Q6Ci0Vb1FUTz8ki3uhrZgfDC_vzZiY";

class ApiRepo{


  Future<LoginResponse> login(BuildContext context,Map<String, String> params) async {
    final response = await http.post(Uri.parse("${ApiUrls.loginUrl}"),body: params);

    print("Api url ${ApiUrls.loginUrl}");
    print("response ${response.body}");
    print("status ${response.statusCode}");
    print("object");
    if(response.statusCode == 200)
    {
      print("200");
      var mobel = json.decode(response.body);



      Prefs.setBool('is_logged_in_new', true);
      Prefs.setString('user_id_new', "${mobel['data']['id'] ?? ""}");
      Prefs.setString('user_email', "${mobel['data']['email'] ?? ""}");
      Prefs.setString("user_name", "${mobel['data']['first_name'] ?? ""} ${mobel['data']['last_name'] ?? ""}");
      Prefs.setString('user_auth_token', "${mobel['data']['jwt_token'] ?? ""}");
      Prefs.setString('mobile', "${mobel['data']['mobile_no'] ?? ""}");


      Prefs.loadData();

      print("token ${Prefs.check_auth_token}");

      Navigator.pop(context);


      replaceRoute(context,DashBoard(currentIndex: 0));
    }
    else
    {

      Navigator.pop(context);

      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['responseMessage']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }

    return loginResponseFromJson(response.body);
  }

  forgotPassword(var params, BuildContext context, String email) async
  {
    final response = await http.post(Uri.parse(ApiUrls.forgotPasswordUrl),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );


    print("params ${params}");
    print("Api url ${ApiUrls.forgotPasswordUrl}");
    print("response ${response.body}");
    Navigator.pop(context);


    if(response.statusCode == 200)
    {
      pushTo(context, ForgotPasswordVerificationPage(email: email,));
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['responseMessage']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['responseMessage']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  changePasswordResponse(var params, BuildContext context) async {
    final response = await http.post(Uri.parse("${ApiUrls.changePassword}"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}',}
    );

    print("params ${params}");
    print("Api url ${ApiUrls.changePassword}");
    print("response ${response.body}");

    var res = await json.decode(response.body);

    if(response.statusCode == 200)
    {
      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

      replaceRoute(context, LoginPage());
    }
    else
    {
      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }


  resendOtp(var params, BuildContext context) async
  {
    final response = await http.post(Uri.parse(ApiUrls.forgotPasswordUrl),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );


    print("params ${params}");
    print("Api url ${ApiUrls.forgotPasswordUrl}");
    print("response ${response.body}");

    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  resetPassword(var params, BuildContext context) async
  {
    final response = await http.post(Uri.parse(ApiUrls.resetPasswordUrl),
        body: params
    );


    print("params ${params}");
    print("Api url ${ApiUrls.resetPasswordUrl}");
    print("response ${response.body}");
  Navigator.pop(context);

    if(response.statusCode == 200)
    {
      replaceRoute(context, LoginPage());
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  Future<PickupListResponse> getPickupList() async {
    final response = await http.get(Uri.parse("${ApiUrls.pickupListUrl}"),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'});

    print("Api url ${ApiUrls.pickupListUrl}");
    print("response ${response.body}");

    return pickupResponseFromJson(response.body);
  }

  Future<PickupListResponse> getCollectedList(String query) async {
    final response = await http.post(Uri.parse("${ApiUrls.collectedListUrl}"),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'},body: {"query":query});

    print("Api url ${ApiUrls.collectedListUrl}");
    print("query ${query}");
    print("response ${response.body}");

    return pickupResponseFromJson(response.body);
  }

  Future<LeaveListResponse> getLeaveList() async {
    final response = await http.get(Uri.parse("${ApiUrls.leaveListUrl}"),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'});

    print("Api url ${ApiUrls.leaveListUrl}");
    print("response ${response.body}");

    return leaveListFromJson(response.body);
  }


   updateCollectedStatusList(BuildContext context, Map<String, String> params) async {
  final response = await http.post(Uri.parse(ApiUrls.updateSampleStatusUrl),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}',},body: params
  );

  print(params);
  print("Api url ${ApiUrls.updateSampleStatusUrl}");
  print("response ${response.body}");


  var res = await json.decode(response.body);

  if(response.statusCode == 200)
  {
    Navigator.pop(context);
  EasyLoading.showToast("${res['message']}",
  dismissOnTap: true,
  duration: const Duration(seconds: 1),
  toastPosition: EasyLoadingToastPosition.center);
  }

  else
  {
  EasyLoading.showToast("${res['message']}",
  dismissOnTap: true,
  duration: const Duration(seconds: 1),
  toastPosition: EasyLoadingToastPosition.center);
  }

  return json.decode(response.body);
  }


  Future<PickupListResponse> searchPickupSamples(BuildContext context, Map<String, String> params) async {
  final response = await http.post(Uri.parse(ApiUrls.searchSamplePickups),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}',},body: params
  );

  print(params);
  print("Api url ${ApiUrls.searchSamplePickups}");
  print("response ${response.body}");


  return pickupResponseFromJson(response.body);
  }



  Future<EnquiryListResponse> searchEnquiry(BuildContext context, Map<String, String> params) async {
  final response = await http.post(Uri.parse(ApiUrls.searchEnquiryUrl),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}',},body: params
  );

  print(params);
  print("Api url ${ApiUrls.searchEnquiryUrl}");
  print("response ${response.body}");


  return enquiryListResponseFromJson(response.body);
  }

  Future<EnquiryListResponse> getEnquiryList() async {
    final response = await http.get(Uri.parse("${ApiUrls.enquiryListUrl}"),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'});

    print("Api url ${ApiUrls.enquiryListUrl}");
    print("response ${response.body}");

    return enquiryListResponseFromJson(response.body);
  }

  Future<MedicalTestResponse> getMedicalTests() async {
    final response = await http.get(Uri.parse("${ApiUrls.medicalTestsUrl}"),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'});

    print("Api url ${ApiUrls.medicalTestsUrl}");
    print("response ${response.body}");

    return medicalTestResponseFromJson(response.body);
  }

  addEnquiry(var params, BuildContext context) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.addEnquiryUrl}"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );

    Navigator.pop(context);
    Navigator.pop(context);

    print("params ${params}");
    print("Api url ${ApiUrls.addEnquiryUrl}");
    print("response ${response.body}");


    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  updateEnquiry(var params, BuildContext context,String id) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.updateEnquiryUrl}/$id"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );

    Navigator.pop(context);
    Navigator.pop(context);

    print("params ${params}");
    print("Api url ${ApiUrls.updateEnquiryUrl}");
    print("response ${response.body}");


    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  addLeave(var params, BuildContext context) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.addLeaveUrl}"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );

    Navigator.pop(context);
    Navigator.pop(context);

    print("params ${params}");
    print("Api url ${ApiUrls.addLeaveUrl}");
    print("response ${response.body}");


    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  updateLeave(var params, BuildContext context,String id) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.updateLeaveUrl}/$id"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );

    Navigator.pop(context);
    Navigator.pop(context);

    print("params ${params}");
    print("Api url ${ApiUrls.updateLeaveUrl}");
    print("response ${response.body}");


    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  Future<LeaveListResponse> searchLeave(BuildContext context, Map<String, String> params) async {
    final response = await http.post(Uri.parse(ApiUrls.searchLeaveUrl),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}',},body: params
    );

    print(params);
    print("Api url ${ApiUrls.searchLeaveUrl}");
    print("response ${response.body}");


    return leaveListFromJson(response.body);
  }

  addJourneyPlanner(var params, BuildContext context) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.addJourneyPlannerUrl}"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );

    Navigator.pop(context);
    Navigator.pop(context);

    print("params ${params}");
    print("Api url ${ApiUrls.addJourneyPlannerUrl}");
    print("response ${response.body}");


    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  updateJourneyPlanner(var params, BuildContext context, String id) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.updateJourneyPlannerUrl}/$id"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );

    Navigator.pop(context);
    Navigator.pop(context);

    print("params ${params}");
    print("Api url ${ApiUrls.updateJourneyPlannerUrl}");
    print("response ${response.body}");


    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }


  Future<JourneyPlannerListResponse> getJourneyPlannerList() async {
    final response = await http.post(Uri.parse("${ApiUrls.journeyPlannerListUrl}"),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'},body: {"query":""});

    print("Api url ${ApiUrls.journeyPlannerListUrl}");
    print("response ${response.body}");

    return journeyPlannerListResponseFromJson(response.body);
  }

  Future<JourneyPlannerListResponse> searchJourneyPlannerList(String query) async {
    final response = await http.post(Uri.parse("${ApiUrls.journeyPlannerListUrl}"),
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'},body: {"query": query});

    print("Api url ${ApiUrls.journeyPlannerListUrl}");
    print("response ${response.body}");

    return journeyPlannerListResponseFromJson(response.body);
  }

  addDailyReports(var params, BuildContext context) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.addDailyReportsUrl}"),
        body: params,
        headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'}
    );

    Navigator.pop(context);
    Navigator.pop(context);

    print("params ${params}");
    print("Api url ${ApiUrls.addDailyReportsUrl}");
    print("response ${response.body}");


    if(response.statusCode == 200)
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);

    }
    else
    {
      var res = await json.decode(response.body);

      EasyLoading.showToast("${res['message']}",
          dismissOnTap: true,
          duration: const Duration(seconds: 1),
          toastPosition: EasyLoadingToastPosition.center);
    }
  }

  Future<DailyReportsResponse> getDailyReports(String query) async {
    final response = await http.post(Uri.parse("${ApiUrls.dailyReportsListUrl}"),headers: {'Authorization': 'Bearer ${Prefs.check_auth_token}'},body: {"query":query});

    print("Api url ${ApiUrls.dailyReportsListUrl}");
    print("response ${response.body}");

    return dailyReportsResponseFromJson(response.body);
  }


}