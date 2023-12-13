import 'dart:convert';

PickupListResponse pickupResponseFromJson(String str) => PickupListResponse.fromJson(json.decode(str));


class PickupListResponse {
  List<PickupData>? data;

  PickupListResponse({this.data});

  PickupListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PickupData>[];
      json['data'].forEach((v) {
        data!.add(new PickupData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PickupData {
  int? id;
  int? userId;
  int? sampleBookingId;
  String? fieldRepresentativeName;
  String? sampleStatus;
  String? createdAt;
  String? orderId;
  String? receiptNo;
  String? recurrenceScore;
  String? specimenInformation;
  String? specimenInformationLocationOfSpecimen;
  String? specimenInformationPhone;
  String? name;
  String? dob;
  String? gender;
  String? hospitalRegNoFileNo;
  String? streetAddressCity;
  String? state;
  String? postCode;
  String? country;
  String? phone;
  String? email;

  PickupData(
      {this.id,
        this.userId,
        this.sampleBookingId,
        this.fieldRepresentativeName,
        this.sampleStatus,
        this.createdAt,
        this.orderId,
        this.receiptNo,
        this.recurrenceScore,
        this.specimenInformation,
        this.specimenInformationLocationOfSpecimen,
        this.specimenInformationPhone,
        this.name,
        this.dob,
        this.gender,
        this.hospitalRegNoFileNo,
        this.streetAddressCity,
        this.state,
        this.postCode,
        this.country,
        this.phone,
        this.email});

  PickupData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sampleBookingId = json['sample_booking_id'];
    fieldRepresentativeName = json['field_representative_name'];
    sampleStatus = json['sample_status'];
    createdAt = json['created_at'];
    orderId = json['order_id'];
    receiptNo = json['receipt_no'];
    recurrenceScore = json['recurrence_score'];
    specimenInformation = json['specimen_information'];
    specimenInformationLocationOfSpecimen =
    json['specimen_information_location_of_specimen'];
    specimenInformationPhone = json['specimen_information_phone'];
    name = json['name'];
    dob = json['dob'];
    gender = json['gender'];
    hospitalRegNoFileNo = json['hospital_reg_no_file_no'];
    streetAddressCity = json['street_address_city'];
    state = json['state'];
    postCode = json['post_code'];
    country = json['country'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['sample_booking_id'] = this.sampleBookingId;
    data['field_representative_name'] = this.fieldRepresentativeName;
    data['sample_status'] = this.sampleStatus;
    data['created_at'] = this.createdAt;
    data['order_id'] = this.orderId;
    data['receipt_no'] = this.receiptNo;
    data['recurrence_score'] = this.recurrenceScore;
    data['specimen_information'] = this.specimenInformation;
    data['specimen_information_location_of_specimen'] =
        this.specimenInformationLocationOfSpecimen;
    data['specimen_information_phone'] = this.specimenInformationPhone;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['hospital_reg_no_file_no'] = this.hospitalRegNoFileNo;
    data['street_address_city'] = this.streetAddressCity;
    data['state'] = this.state;
    data['post_code'] = this.postCode;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}


