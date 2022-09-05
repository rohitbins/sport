class PnpAttendanceIn {
  int? statusCode;
  bool? isError;
  String? message;
  Null? data;

  PnpAttendanceIn({this.statusCode, this.isError, this.message, this.data});

  PnpAttendanceIn.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isError = json['isError'];
    message = json['message'];
    data = json['data'];
  }

  get pnpCustomerId => null;

  get slotId => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['isError'] = this.isError;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}