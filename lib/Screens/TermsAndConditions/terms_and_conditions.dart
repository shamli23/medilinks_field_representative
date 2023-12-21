import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants/const_files.dart';
import '../../models/PrivacyPolicyResponse.dart';
import '../../repository/api_repo.dart';


class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  PrivacyPolicyResponse? privacyPolicyResponse;


  fetchProfileData() async
  {

    Map<String, String> param = new Map<String, String>();
    param["slug"] = "Terms_&_Conditions";

    Future.delayed(Duration.zero, () {
      showLoader(context);
    });

    try{
      var response = await ApiRepo().getPrivacyPolicyList(context, param);

      if( response.data != null)
      {
        try{
          privacyPolicyResponse = response;
        }
        catch(e){}
      }
    }
    catch(e){}

    Navigator.pop(context);

    setState(() {});
  }

  @override
  void initState() {
    fetchProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget html = HtmlWidget(
      onTapUrl: (url)async {
        return await launchUrl(Uri.parse(url));},
       (privacyPolicyResponse?.data?.description == null ? "" : privacyPolicyResponse?.data?.description.toString())??"",
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColor.appColor,
        centerTitle: true,
        title: const Text("Terms & Conditions", style:  TextStyle(
            color: Colors.white
        ),),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Image.asset(
              "assets/images/back_button.png",
              color: Colors.white,
            ),
          ),
        ), ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          children: [
            html
          ],
        ),
      ),
    );
  }
}
