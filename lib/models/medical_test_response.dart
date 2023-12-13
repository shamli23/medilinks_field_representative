import 'dart:convert';

MedicalTestResponse medicalTestResponseFromJson(String str) => MedicalTestResponse.fromJson(json.decode(str));


class MedicalTestResponse {
  int? status;
  String? message;
  List<MedicalTests>? medicalTests;

  MedicalTestResponse({this.status, this.message, this.medicalTests});

  MedicalTestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['medical_tests'] != null) {
      medicalTests = <MedicalTests>[];
      json['medical_tests'].forEach((v) {
        medicalTests!.add(new MedicalTests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.medicalTests != null) {
      data['medical_tests'] =
          this.medicalTests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicalTests {
  int? id;
  String? title;

  MedicalTests({this.id, this.title});

  MedicalTests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}


