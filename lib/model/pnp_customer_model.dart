class PnpCustomerModel {
  int? statusCode;
  bool? isError;
  String? message;
  List<Data>? data;

  PnpCustomerModel({this.statusCode, this.isError, this.message, this.data});

  PnpCustomerModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isError = json['isError'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? bookingId;
  String? bookingDate;
  String? status;
  int? pnpCustomerId;
  String? pnpCustomer;
  int? slotId;
  String? phone;
  String? sport;
  String? sportLogo;
  String? facilityName;
  String? inTime;
  String? outTime;
  int? pnpFee;

  Data(
      {this.bookingId,
      this.bookingDate,
      this.status,
      this.pnpCustomerId,
      this.pnpCustomer,
      this.slotId,
      this.phone,
      this.sport,
      this.sportLogo,
      this.facilityName,
      this.inTime,
      this.outTime,
      this.pnpFee});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    bookingDate = json['bookingDate'];
    status = json['status'];
    pnpCustomerId = json['pnpCustomerId'];
    pnpCustomer = json['pnpCustomer'];
    slotId = json['slotId'];
    phone = json['phone'];
    sport = json['sport'];
    sportLogo = json['sportLogo'];
    facilityName = json['facilityName'];
    inTime = json['inTime'];
    outTime = json['outTime'];
    pnpFee = json['pnpFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = this.bookingId;
    data['bookingDate'] = this.bookingDate;
    data['status'] = this.status;
    data['pnpCustomerId'] = this.pnpCustomerId;
    data['pnpCustomer'] = this.pnpCustomer;
    data['slotId'] = this.slotId;
    data['phone'] = this.phone;
    data['sport'] = this.sport;
    data['sportLogo'] = this.sportLogo;
    data['facilityName'] = this.facilityName;
    data['inTime'] = this.inTime;
    data['outTime'] = this.outTime;
    data['pnpFee'] = this.pnpFee;
    return data;
  }
}
