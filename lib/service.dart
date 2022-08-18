import 'dart:convert';
import 'dart:async';
import 'package:sport/model/attendance.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:http/http.dart' as http;
import 'package:sport/model/customer_list_out.dart';
import 'package:sport/model/payment.dart';
import 'package:sport/model/personal_sport.dart';
import 'package:sport/utils/enums.dart';
import 'model/otp_validator.dart';
import 'model/phone_validator.dart';
import 'model/request/customer_data.dart';

class ServiceCall {
  String base = 'http://api.sportsb.co.in/api/';
  Map<String, String> headers = {
    'staff-key': 'iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA=',
    'ContentType': 'application/json'
  };
  Future<CategoryAndBatch> fetchBatchCatgories() async {
    final response = await http.post(
        Uri.parse('$base${EndPoints.staffAcademyCategoryAndBatch.apiValue}'),
        headers: headers,
        body: {});

    if (response.statusCode == 200) {
      CategoryAndBatch categoryAndBatch =
          CategoryAndBatch.fromJson(jsonDecode(response.body));
      return categoryAndBatch;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

  Future<CustomerListData> fetchCustomerData(
      {required CustomerDataRequest customerDataRequest}) async {
    final response = await http.post(
        Uri.parse('$base${EndPoints.customerListByBatchAndCategory.apiValue}'),
        body: customerDataRequest.toJson(),
        headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      CustomerListData customerListData =
          CustomerListData.fromJson(jsonDecode(response.body));

      return customerListData;
    } else {
      throw Exception('failed to load CustomerList');
    }
  }

  Future<PhoneValidator> PhoneValidatorApi(
      {required String phoneNumber}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'token': 'CFE25CAB1BA245F89E1158LOPSU598USPIE24T6'
    };
    final response = await http.post(Uri.parse('${base}PhoneValidator'),
        headers: _header, body: {"phone": phoneNumber, "source": "Android"});

    if (response.statusCode == 200) {
      print(response.body);
      PhoneValidator phoneValidator =
          PhoneValidator.fromJson(jsonDecode(response.body));
      return phoneValidator;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

  Future<OtpValidator> OtpValidatorApi(
      {required String phoneNumber, required String otp}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'token': 'CFE25CAB1BA245F89E1158LOPSU598USPIE24T6'
    };
    final response = await http.post(Uri.parse('${base}OTPValidator'),
        headers: _header,
        body: {"phone": phoneNumber, "source": "Android", "OTP": otp});

    if (response.statusCode == 200) {
      OtpValidator otpValidator =
          OtpValidator.fromJson(jsonDecode(response.body));
      return otpValidator;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

  Future<CustomerListOut> fetchCustomerOut() async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': 'iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA='
    };
    final response = await http.post(Uri.parse('${base}CustomerListForOut'),
        headers: _header, body: {});

    if (response.statusCode == 200) {
      print(response.body);
      CustomerListOut customerOut =
          CustomerListOut.fromJson(jsonDecode(response.body));
      return customerOut;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

  Future<CustomerListOut> attendanceIn({required String customerKey}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': 'iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA=',
      'customer-key': customerKey
    };
    final response = await http.post(
        Uri.parse('${base}SetCustomerAttendanceIn'),
        headers: _header,
        body: {});

    if (response.statusCode == 200) {
      print(response.body);
      CustomerListOut customerOut =
          CustomerListOut.fromJson(jsonDecode(response.body));
      return customerOut;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

  Future<CustomerListOut> attendanceOut({required String key}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': 'iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA=',
      'customer-key': key
    };
    final response = await http.post(
        Uri.parse('${base}SetCustomerAttendanceOut'),
        headers: _header,
        body: {});

    if (response.statusCode == 200) {
     
      CustomerListOut customerOut =
          CustomerListOut.fromJson(jsonDecode(response.body));
      return customerOut;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }



 


  Future<List<Attendance>?> fetchAttendance() async {
    Map<String, String> _header = {'ContentType': 'application/json',
    'customer-key': 'EQYGf84gWWMJsi8Bz/73ufdftIdOKyta1YohLogAL5U='};
    final response = await http.post(Uri.parse('${base}CustomerAttendance'),
    body:{"Indx": "0","IdForNew":"0"},headers: _header);
   
      if (response.statusCode == 200){
        CustomerAttendance customerAttendance = 
        CustomerAttendance.fromJson(jsonDecode(response.body));

        return 
        customerAttendance.data.attendanceList;

      }else {
        throw Exception("Failed to loading");
      }
  }

  Future<List<Payment>?> fetchPayment() async {
    Map<String,String> _header = {'ContentType': 'application/json',
    "customer-key": "EQYGf84gWWMJsi8Bz/73ufdftIdOKyta1YohLogAL5U="};
    final response = await http.post(Uri.parse('${base}CustomerPayment'),
    body: {}, headers: _header);
    if(response.statusCode == 200) {
      
      CustomerPayment customerPayment =
      CustomerPayment.fromJson(jsonDecode(response.body));

      return customerPayment.data.paymentList;
    }else {
      throw Exception("failed to loading");
    }
  }

 Future<PersonalSportModel?> fetchProfileData(String _key) async {
  Map<String, String> _header = {'ContentType': 'application/json',
  'staff-key' : 'iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA=', 
  'customer-key': _key};
  final response = await http.post(Uri.parse('${base}CustomerProfile'),
  body:{}, headers: _header );
  
  if (response.statusCode ==200){
    PersonalSportModel personalSportModel = 
    PersonalSportModel.fromJson(jsonDecode(response.body));

    return personalSportModel;
  }
 }
}

