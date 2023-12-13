import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ConstColor
{
  static var appColor = HexColor("#E12454");
  static var backgroundColor = Colours.whiteSmoke;

}

showLoader(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            color: Colors.black26,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:   Center(
              child: CircularProgressIndicator(color: ConstColor.appColor,),
            ),
          ),
        );
      });
}
