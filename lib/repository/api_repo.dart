import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medilinks_doctor_app/models/enquiry_list_response.dart';
import 'package:medilinks_doctor_app/models/leave_list_response.dart';
import 'package:medilinks_doctor_app/models/medical_test_response.dart';
import 'package:medilinks_doctor_app/models/pickup_list_response.dart';
import 'package:http/http.dart'as http;
import '../Constants/api_urls.dart';

 const  accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYWR2YW5jZW1lZGlsaW5rcy5jb21cL2FwaVwvZmllbGQtcmVwcmVzZW50YXRpdmUtbG9naW4iLCJpYXQiOjE3MDI0Njk2OTEsImV4cCI6MTcwMjQ3MzI5MSwibmJmIjoxNzAyNDY5NjkxLCJqdGkiOiJ5MFJkOTdRdkpieFZDOWFhIiwic3ViIjoxNzIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.DyqgauyTRt-Wpzg1KrBOFU1FPjWGgYhJfkebkwnDf4Q";

class ApiRepo{
  Future<PickupListResponse> getPickupList() async {
    final response = await http.get(Uri.parse("${ApiUrls.pickupListUrl}"),headers: {'Authorization': 'Bearer $accessToken'});

    print("Api url ${ApiUrls.pickupListUrl}");
    print("response ${response.body}");

    return pickupResponseFromJson(response.body);
  }

  Future<PickupListResponse> getCollectedList() async {
    final response = await http.get(Uri.parse("${ApiUrls.collectedListUrl}"),headers: {'Authorization': 'Bearer $accessToken'});

    print("Api url ${ApiUrls.collectedListUrl}");
    print("response ${response.body}");

    return pickupResponseFromJson(response.body);
  }

  Future<LeaveListResponse> getLeaveList() async {
    final response = await http.get(Uri.parse("${ApiUrls.leaveListUrl}"),headers: {'Authorization': 'Bearer $accessToken'});

    print("Api url ${ApiUrls.leaveListUrl}");
    print("response ${response.body}");

    return leaveListFromJson(response.body);
  }


   updateCollectedStatusList(BuildContext context, Map<String, String> params) async {
  final response = await http.post(Uri.parse(ApiUrls.updateSampleStatusUrl),headers: {'Authorization': 'Bearer $accessToken',},body: params
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
  final response = await http.post(Uri.parse(ApiUrls.searchSamplePickups),headers: {'Authorization': 'Bearer $accessToken',},body: params
  );

  print(params);
  print("Api url ${ApiUrls.searchSamplePickups}");
  print("response ${response.body}");


  return pickupResponseFromJson(response.body);
  }



  Future<EnquiryListResponse> searchEnquiry(BuildContext context, Map<String, String> params) async {
  final response = await http.post(Uri.parse(ApiUrls.searchEnquiryUrl),headers: {'Authorization': 'Bearer $accessToken',},body: params
  );

  print(params);
  print("Api url ${ApiUrls.searchEnquiryUrl}");
  print("response ${response.body}");


  return enquiryListResponseFromJson(response.body);
  }

  Future<EnquiryListResponse> getEnquiryList() async {
    final response = await http.get(Uri.parse("${ApiUrls.enquiryListUrl}"),headers: {'Authorization': 'Bearer $accessToken'});

    print("Api url ${ApiUrls.enquiryListUrl}");
    print("response ${response.body}");

    return enquiryListResponseFromJson(response.body);
  }

  Future<MedicalTestResponse> getMedicalTests() async {
    final response = await http.get(Uri.parse("${ApiUrls.medicalTestsUrl}"),headers: {'Authorization': 'Bearer $accessToken'});

    print("Api url ${ApiUrls.medicalTestsUrl}");
    print("response ${response.body}");

    return medicalTestResponseFromJson(response.body);
  }

  addEnquiry(var params, BuildContext context) async
  {
    final response = await http.post(Uri.parse("${ApiUrls.addEnquiryUrl}"),
        body: params,
        headers: {'Authorization': 'Bearer $accessToken'}
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
        headers: {'Authorization': 'Bearer $accessToken'}
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
        headers: {'Authorization': 'Bearer $accessToken'}
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
        headers: {'Authorization': 'Bearer $accessToken'}
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
    final response = await http.post(Uri.parse(ApiUrls.searchLeaveUrl),headers: {'Authorization': 'Bearer $accessToken',},body: params
    );

    print(params);
    print("Api url ${ApiUrls.searchLeaveUrl}");
    print("response ${response.body}");


    return leaveListFromJson(response.body);
  }


}