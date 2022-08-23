class BaseResponseModel {
  int? statusCode;
  bool? isError;
  String? message;
  Null? data;

  BaseResponseModel({this.statusCode, this.isError, this.message, this.data});

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isError = json['isError'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['isError'] = this.isError;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
