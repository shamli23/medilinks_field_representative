import 'dart:convert';

DailyReportsResponse dailyReportsResponseFromJson(String str) => DailyReportsResponse.fromJson(json.decode(str));


class DailyReportsResponse {
  int? status;
  List<DailyReports>? dailyReports;

  DailyReportsResponse({this.status, this.dailyReports});

  DailyReportsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['daily_reports'] != null) {
      dailyReports = <DailyReports>[];
      json['daily_reports'].forEach((v) {
        dailyReports!.add(new DailyReports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dailyReports != null) {
      data['daily_reports'] =
          this.dailyReports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailyReports {
  int? id;
  int? userId;
  String? fieldRepresentativeName;
  String? hospitalName;
  String? docName;
  String? address;
  String? state;
  String? city;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  DailyReports(
      {this.id,
        this.userId,
        this.fieldRepresentativeName,
        this.hospitalName,
        this.docName,
        this.address,
        this.state,
        this.city,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  DailyReports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fieldRepresentativeName = json['field_representative_name'];
    hospitalName = json['hospital_name'];
    docName = json['doc_name'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['field_representative_name'] = this.fieldRepresentativeName;
    data['hospital_name'] = this.hospitalName;
    data['doc_name'] = this.docName;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}


