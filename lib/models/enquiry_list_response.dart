import 'dart:convert';

EnquiryListResponse enquiryListResponseFromJson(String str) => EnquiryListResponse.fromJson(json.decode(str));


class EnquiryListResponse {
  String? status;
  String? message;
  List<Enquiries>? enquiries;

  EnquiryListResponse({this.status, this.message, this.enquiries});

  EnquiryListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    message = json['message'];
    if (json['enquiries'] != null) {
      enquiries = <Enquiries>[];
      json['enquiries'].forEach((v) {
        enquiries!.add(new Enquiries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.enquiries != null) {
      data['enquiries'] = this.enquiries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Enquiries {
  int? id;
  int? userId;
  String? testName;
  String? source;
  String? doctorName;
  String? city;
  String? fieldRepresentativeName;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Enquiries(
      {this.id,
        this.userId,
        this.testName,
        this.source,
        this.doctorName,
        this.city,
        this.fieldRepresentativeName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Enquiries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    testName = json['test_name'];
    source = json['source'];
    doctorName = json['doctor_name'];
    city = json['city'];
    fieldRepresentativeName = json['field_representative_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['test_name'] = this.testName;
    data['source'] = this.source;
    data['doctor_name'] = this.doctorName;
    data['city'] = this.city;
    data['field_representative_name'] = this.fieldRepresentativeName;
    data['created_at'] = this.createdAt;
    data['updated at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}