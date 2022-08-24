// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class StaffAttendanceModel {
  int? statusCode;
  bool? isError;
  String? message;
  List<StaffData>? data;

  StaffAttendanceModel(
      {this.statusCode, this.isError, this.message, this.data});

  StaffAttendanceModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isError = json['isError'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StaffData>[];
      json['data'].forEach((v) {
        data!.add(new StaffData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['isError'] = this.isError;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StaffData {
  int? id;
  String? inDate;
  String? inTime;
  String? outTime;
  String? outDate;
  String? totalInTime;

  StaffData(
      {this.id,
      this.inDate,
      this.inTime,
      this.outTime,
      this.outDate,
      this.totalInTime});

  StaffData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inDate = json['inDate'];
    inTime = json['inTime'];
    outTime = json['outTime'];
    outDate = json['outDate'];
    totalInTime = json['totalInTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inDate'] = this.inDate;
    data['inTime'] = this.inTime;
    data['outTime'] = this.outTime;
    data['outDate'] = this.outDate;
    data['totalInTime'] = this.totalInTime;
    return data;
  }
}
