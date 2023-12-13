import 'dart:convert';

LeaveListResponse leaveListFromJson(String str) => LeaveListResponse.fromJson(json.decode(str));


class LeaveListResponse {
  int? status;
  String? message;
  List<Leaves>? leaves;

  LeaveListResponse({this.status, this.message, this.leaves});

  LeaveListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['leaves'] != null) {
      leaves = <Leaves>[];
      json['leaves'].forEach((v) {
        leaves!.add(new Leaves.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.leaves != null) {
      data['leaves'] = this.leaves!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leaves {
  int? id;
  int? userId;
  String? fieldRepresentativeName;
  String? typeOfLeave;
  String? onedayMultiple;
  String? oneDayDate;
  String? fromDate;
  String? toDate;
  String? reason;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Leaves(
      {this.id,
        this.userId,
        this.fieldRepresentativeName,
        this.typeOfLeave,
        this.onedayMultiple,
        this.oneDayDate,
        this.fromDate,
        this.toDate,
        this.reason,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Leaves.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fieldRepresentativeName = json['field_representative_name'];
    typeOfLeave = json['type_of_leave'];
    onedayMultiple = json['oneday_multiple'];
    oneDayDate = json['one_day_date'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    reason = json['reason'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['field_representative_name'] = this.fieldRepresentativeName;
    data['type_of_leave'] = this.typeOfLeave;
    data['oneday_multiple'] = this.onedayMultiple;
    data['one_day_date'] = this.oneDayDate;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}