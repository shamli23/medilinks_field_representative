import 'dart:convert';

JourneyPlannerListResponse journeyPlannerListResponseFromJson(String str) => JourneyPlannerListResponse.fromJson(json.decode(str));


class JourneyPlannerListResponse {
  int? status;
  List<MeetingGroups>? meetingGroups;

  JourneyPlannerListResponse({this.status, this.meetingGroups});

  JourneyPlannerListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['meetingGroups'] != null) {
      meetingGroups = <MeetingGroups>[];
      json['meetingGroups'].forEach((v) {
        meetingGroups!.add(new MeetingGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.meetingGroups != null) {
      data['meetingGroups'] =
          this.meetingGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeetingGroups {
  String? city;
  String? fromDate;
  String? toDate;
  int? meetingCount;
  List<Meetings>? meetings;

  MeetingGroups(
      {this.city,
        this.fromDate,
        this.toDate,
        this.meetingCount,
        this.meetings});

  MeetingGroups.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    meetingCount = json['meetingCount'];
    if (json['meetings'] != null) {
      meetings = <Meetings>[];
      json['meetings'].forEach((v) {
        meetings!.add(new Meetings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['meetingCount'] = this.meetingCount;
    if (this.meetings != null) {
      data['meetings'] = this.meetings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meetings {
  int? id;
  int? userId;
  String? fieldRepresentativeName;
  String? city;
  String? fromDate;
  String? toDate;
  String? docName;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Meetings(
      {this.id,
        this.userId,
        this.fieldRepresentativeName,
        this.city,
        this.fromDate,
        this.toDate,
        this.docName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Meetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    fieldRepresentativeName = json['field_representative_name'];
    city = json['city'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    docName = json['doc_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['field_representative_name'] = this.fieldRepresentativeName;
    data['city'] = this.city;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['doc_name'] = this.docName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}


