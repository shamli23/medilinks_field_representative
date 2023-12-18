import 'dart:convert';


LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));


class LoginResponse {
  int? isVerified;
  String? responseMessage;
  Data? data;

  LoginResponse({this.isVerified, this.responseMessage, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isVerified = json['is_verified'];
    responseMessage = json['responseMessage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_verified'] = this.isVerified;
    data['responseMessage'] = this.responseMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Null? userId;
  String? firstName;
  String? lastName;
  int? mobileNo;
  String? profileImg;
  String? type;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  int? roleId;
  Null? otp;
  int? status;
  String? deviceType;
  Null? deviceToken;
  String? jwtToken;
  Null? cityId;
  Null? statesId;
  Null? countryId;
  String? address;
  Null? pinCode;
  String? gender;
  Null? history;
  Null? reference;
  Null? anyTestDoneBefore;
  Null? allergies;
  Null? experience;
  Null? institution;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? specialist;

  Data(
      {this.id,
        this.userId,
        this.firstName,
        this.lastName,
        this.mobileNo,
        this.profileImg,
        this.type,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.roleId,
        this.otp,
        this.status,
        this.deviceType,
        this.deviceToken,
        this.jwtToken,
        this.cityId,
        this.statesId,
        this.countryId,
        this.address,
        this.pinCode,
        this.gender,
        this.history,
        this.reference,
        this.anyTestDoneBefore,
        this.allergies,
        this.experience,
        this.institution,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.specialist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobileNo = json['mobile_no'];
    profileImg = json['profile_img'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    otp = json['otp'];
    status = json['status'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    jwtToken = json['jwt_token'];
    cityId = json['city_id'];
    statesId = json['states_id'];
    countryId = json['country_id'];
    address = json['address'];
    pinCode = json['pin_code'];
    gender = json['gender'];
    history = json['history'];
    reference = json['reference'];
    anyTestDoneBefore = json['any_test_done_before'];
    allergies = json['allergies'];
    experience = json['experience'];
    institution = json['institution'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    specialist = json['specialist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile_no'] = this.mobileNo;
    data['profile_img'] = this.profileImg;
    data['type'] = this.type;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role_id'] = this.roleId;
    data['otp'] = this.otp;
    data['status'] = this.status;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['jwt_token'] = this.jwtToken;
    data['city_id'] = this.cityId;
    data['states_id'] = this.statesId;
    data['country_id'] = this.countryId;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['gender'] = this.gender;
    data['history'] = this.history;
    data['reference'] = this.reference;
    data['any_test_done_before'] = this.anyTestDoneBefore;
    data['allergies'] = this.allergies;
    data['experience'] = this.experience;
    data['institution'] = this.institution;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['specialist'] = this.specialist;
    return data;
  }
}