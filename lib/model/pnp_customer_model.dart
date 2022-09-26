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
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['isError'] = isError;
    data['message'] = message;
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
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['bookingId'] = bookingId;
    data['bookingDate'] = bookingDate;
    data['status'] = status;
    data['pnpCustomerId'] = pnpCustomerId;
    data['pnpCustomer'] = pnpCustomer;
    data['slotId'] = slotId;
    data['phone'] = phone;
    data['sport'] = sport;
    data['sportLogo'] = sportLogo;
    data['facilityName'] = facilityName;
    data['inTime'] = inTime;
    data['outTime'] = outTime;
    data['pnpFee'] = pnpFee;
    return data;
  }
}
