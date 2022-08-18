// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class PersonalSportModel {
  int? statusCode;
  bool? isError;
  String? message;
  Data? data;

  PersonalSportModel({this.statusCode, this.isError, this.message, this.data});

  PersonalSportModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isError = json['isError'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['isError'] = this.isError;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  PersonalInfo? personalInfo;
  SportsInfo? sportsInfo;

  Data({this.personalInfo, this.sportsInfo});

  Data.fromJson(Map<String, dynamic> json) {
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
    sportsInfo = json['sportsInfo'] != null
        ? new SportsInfo.fromJson(json['sportsInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo!.toJson();
    }
    if (this.sportsInfo != null) {
      data['sportsInfo'] = this.sportsInfo!.toJson();
    }
    return data;
  }
}

class PersonalInfo {
  String? dateOfBirth;
  String? name;
  String? fatherName;
  String? email;
  String? mobile;
  String? gender;
  String? address;
  String? state;
  String? city;
  String? pincode;

  PersonalInfo(
      {this.dateOfBirth,
      this.name,
      this.fatherName,
      this.email,
      this.mobile,
      this.gender,
      this.address,
      this.state,
      this.city,
      this.pincode});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    dateOfBirth = json['dateOfBirth'];
    name = json['name'];
    fatherName = json['fatherName'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateOfBirth'] = this.dateOfBirth;
    data['name'] = this.name;
    data['fatherName'] = this.fatherName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    return data;
  }
}

class SportsInfo {
  String? dateOfJoining;
  String? sport;
  String? type;
  String? category;
  String? batch;
  String? feeType;
  String? speciality;
  String? startTime;
  int? totalFee;
  int? discount;
  int? finalFee;

  SportsInfo(
      {this.dateOfJoining,
      this.sport,
      this.type,
      this.category,
      this.batch,
      this.feeType,
      this.speciality,
      this.startTime,
      this.totalFee,
      this.discount,
      this.finalFee});

  SportsInfo.fromJson(Map<String, dynamic> json) {
    dateOfJoining = json['dateOfJoining'];
    sport = json['sport'];
    type = json['type'];
    category = json['category'];
    batch = json['batch'];
    feeType = json['feeType'];
    speciality = json['speciality'];
    startTime = json['startTime'];
    totalFee = json['totalFee'];
    discount = json['discount'];
    finalFee = json['finalFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateOfJoining'] = this.dateOfJoining;
    data['sport'] = this.sport;
    data['type'] = this.type;
    data['category'] = this.category;
    data['batch'] = this.batch;
    data['feeType'] = this.feeType;
    data['speciality'] = this.speciality;
    data['startTime'] = this.startTime;
    data['totalFee'] = this.totalFee;
    data['discount'] = this.discount;
    data['finalFee'] = this.finalFee;
    return data;
  }
}
