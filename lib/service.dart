import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/model/attendance.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/check_permisson.dart';
import 'package:sport/model/customer_list.dart';
import 'package:http/http.dart' as http;
import 'package:sport/model/customer_list_out.dart';
import 'package:sport/model/payment.dart';
import 'package:sport/model/personal_sport.dart';
import 'package:sport/model/pnp_Attendance_in.dart';
import 'package:sport/model/pnp_customer_model.dart';
import 'package:sport/model/staff_attendance_model.dart';
import 'package:sport/utils/constants.dart';
import 'package:sport/utils/enums.dart';
import 'model/baseresponse.dart';
import 'model/otp_validator.dart';
import 'model/phone_validator.dart';
import 'model/request/customer_data.dart';

class ServiceCall {

  String _mode = "TEST"; //to connect to live db use "LIVE" and for test db use "TEST"

  ServiceCall() {
    base = 'http://api.sportsb.co.in/api/';
  }
  // }

  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String base;

// Category and Batch
  Future<CategoryAndBatch> fetchBatchCatgories() async {
    var headers = {
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'ContentType': 'application/json',
      'mode': _mode
    };
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

// Customer List Data////////
  Future<CustomerListData> fetchCustomerData(
      {required CustomerDataRequest customerDataRequest}) async {
    var headers = {
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'ContentType': 'application/json',
      'mode': _mode
    };
    // print('headers:${headers.toString()}');
    final response = await http.post(
        Uri.parse('$base${EndPoints.customerListByBatchAndCategory.apiValue}'),
        body: customerDataRequest.toJson(),
        headers: headers);

    if (response.statusCode == 200) {
      // print(response.body);
      CustomerListData customerListData =
          CustomerListData.fromJson(jsonDecode(response.body));

      return customerListData;
    } else {
      throw Exception('failed to load CustomerList');
    }
  }

// Phone validator
  Future<PhoneValidator> PhoneValidatorApi(
      {required String phoneNumber}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'token': 'CFE25CAB1BA245F89E1158LOPSU598USPIE24T6',
      'mode': _mode
    };
    final response = await http.post(
        Uri.parse('$base${EndPoints.guruPhoneValidator.apiValue}'),
        headers: _header,
        body: {"phone": phoneNumber, "source": "Android"});

    if (response.statusCode == 200) {
      // print(response.body);
      PhoneValidator phoneValidator =
          PhoneValidator.fromJson(jsonDecode(response.body));
      return phoneValidator;
    }
    else {
      throw Exception('failed to load BatchCategories');
    }
  }

// Otp Validator//////
  Future<OtpValidator> OtpValidatorApi(
      {required String phoneNumber, required String otp}) async {
    // print('OtpValidatorApi');
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'token': 'CFE25CAB1BA245F89E1158LOPSU598USPIE24T6',
      'mode': _mode
    };
    final response = await http.post(
        Uri.parse('${base}${EndPoints.guruOTPValidator.apiValue}'),
        headers: _header,
        body: {"phone": phoneNumber, "source": "Android", "OTP": otp});
// print('res'+response.body.toString());
    if (response.statusCode == 200) {
      OtpValidator otpValidator =
          OtpValidator.fromJson(jsonDecode(response.body));
      // print('akey = '+otpValidator.data!.staffKey.toString());
          if(otpValidator.data!.showFee !=null)
          {
            // print("stakePNPAttendance="+otpValidator.data!.takePNPAttendance.toString());
            // print("stakeMemberAttendance="+otpValidator.data!.takeMemberAttendance.toString());
            ShowFee = otpValidator.data!.showFee as bool;
            TakeMemberAttendance = otpValidator.data!.takeMemberAttendance;
            TakePNPAttendance = otpValidator.data!.takePNPAttendance;
          }
          ShowFee = false;
           // print("shown fee="+ShowFee.toString());

      return otpValidator;

    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

// Customer List Out////////
  Future<CustomerListOut> fetchCustomerOut() async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'mode': _mode
    };
    final response = await http.post(
        Uri.parse('${base}${EndPoints.customerListForOut.apiValue}'),
        headers: _header,
        body: {  });

    if (response.statusCode == 200) {
      // print(response.body);
      CustomerListOut customerOut =
          CustomerListOut.fromJson(jsonDecode(response.body));
      return customerOut;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

// Staff Attendance In///////
  Future<CustomerListOut> staffAttendanceIn(
      {required String customerKey}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'customer-key': customerKey,
      'mode': _mode

    };
    final response = await http.post(
        Uri.parse('${base}SetCustomerAttendanceIn'),
        headers: _header,
        body: {});

    if (response.statusCode == 200) {
      // print(response.body);
      CustomerListOut customerOut =
          CustomerListOut.fromJson(jsonDecode(response.body));
      return customerOut;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

// Customer Attendance In/////////
  Future<CustomerListOut> attendanceIn({required String customerKey}) async {
    print('CUSTOMERIN');
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'customer-key': customerKey,
      'mode': _mode
    };
    final response = await http.post(
        Uri.parse('$base${EndPoints.setCustomerAttendanceIn.apiValue}'),
        headers: _header,
        body: {});
print('customerkey'+customerKey.toString());
    if (response.statusCode == 200) {
      CustomerListOut customerOut =
          CustomerListOut.fromJson(jsonDecode(response.body));
      return customerOut;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

// Customer Attendance Out //////
  Future<bool?> attendanceOut({required CustomerOut data}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'customer-key': data.customerKey,
      'mode': _mode
    };
    final response = await http.post(
        Uri.parse('${base}SetCustomerAttendanceOut'),
        headers: _header,
        body: {"customerId": data.id.toString(),
"slotId": data.slotId.toString(),
"isPNP":data.isPNP.toString()});

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('failed to load BatchCategories');
    }
  }

// Customer Attendance /////////
  Future<List<Attendance>?> fetchAttendance(
      {required String customerkey}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'customer-key': customerkey,
      'mode': _mode
    };
    final response = await http.post(Uri.parse('${base}CustomerAttendance'),
        body: {"Indx": "0", "IdForNew": "0"}, headers: _header);

    if (response.statusCode == 200) {
      CustomerAttendance customerAttendance =
          CustomerAttendance.fromJson(jsonDecode(response.body));

      return customerAttendance.data.attendanceList;
    } else {
      throw Exception("Failed to loading");
    }
  }

//CUstomer Payment/////
  Future<List<Payment>?> fetchPayment({required String customerkey}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      "customer-key": customerkey,
      'mode': _mode
    };
    final response = await http.post(Uri.parse('${base}CustomerPayment'),
        body: {}, headers: _header);
    if (response.statusCode == 200) {
      CustomerPayment customerPayment =
          CustomerPayment.fromJson(jsonDecode(response.body));

      return customerPayment.data.paymentList;
    } else {
      throw Exception("failed to loading");
    }
  }

// Profile Data ////////
  Future<PersonalSportModel?> fetchProfileData(String _key) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'customer-key': _key,
      'mode': _mode
    };
    final response = await http.post(Uri.parse('${base}CustomerProfile'),
        body: {}, headers: _header);

    if (response.statusCode == 200) {
      PersonalSportModel personalSportModel =
          PersonalSportModel.fromJson(jsonDecode(response.body));

      return personalSportModel;
    }
  }

// Staff Attendance List ///////
  Future<StaffAttendanceModel?> GetStaffAttendanceList() async {  //working
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'mode': _mode
    };

    final response = await http.post(
        Uri.parse('$base${EndPoints.getStaffAttendanceList.apiValue}'),
        headers: _header,
        body: {});

    if (response.statusCode == 200) {
      StaffAttendanceModel staffAttendanceModel =
          StaffAttendanceModel.fromJson(jsonDecode(response.body));
print('GetStaffAttendanceList = '+response.body.toString());
      return staffAttendanceModel;
    }
  }

// UpDate Staff Attendance //////
  Future<BaseResponseModel?> updateStaffAttendance({required bool isIn}) async {
    Map<String, String> _header = {
      'ContentType': 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'mode': _mode
    };

    final response = await http.post(
        !isIn
            ? Uri.parse('$base${EndPoints.setStaffAttendanceOut.apiValue}')
            : Uri.parse('$base${EndPoints.setStaffAttendanceIn.apiValue}'),
        headers: _header,
        body: {});

    if (response.statusCode == 200) {
      BaseResponseModel baseresponse =
          BaseResponseModel.fromJson(jsonDecode(response.body));

      return baseresponse;
    }
  }

  // Pnp customer List for IN....
  Future<PnpCustomerModel> fetchPnpCustomerModel() async{
    print('hdasgviuadgc');
    Map<String, String> _header = {
      'ContentType' : 'application/json',
      'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
      'mode': _mode
      
    };
     final response = await http.post(Uri.parse('${base}PNPCustomerListForIn'),
    body: {}, headers: _header);
        if (response.statusCode == 200){
          print('doneee');
          // print(response.body.toString());
          PnpCustomerModel pnpCustomerModel = 
          PnpCustomerModel.fromJson(jsonDecode(response.body));
          return pnpCustomerModel;
        }
        else{return PnpCustomerModel();}
        
 }

 // Pnp Customer Attendance in.....
 Future<PnpAttendanceIn?> fetchPnpAttendaneIN({required pnpCustomerId, required slotId}) async{
  Map<String, String> _header = {
    "ContentType" : "application/json",
     'staff-key': await _prefs.then((value) => value.getString(('staffKey'))!),
    'mode': _mode
  };
  final response = await http.post(Uri.parse('${base}SetPNPCustomerAttendanceIn'),
  body: {"pnpCustomerId": pnpCustomerId,
         "slotId":  slotId},
         headers: _header);
         if (response.statusCode == 200){
          PnpAttendanceIn pnpAttendanceIn = 
          PnpAttendanceIn.fromJson(jsonDecode(response.body));
          return pnpAttendanceIn;
         }
 }

 /// Check Permisson
 

 Future<CheckPermisson> fetchPermissonData() async{
    print('function called');
  Map<String, String> _header = {
    'ContentType' : 'application/json',
    'token' : 'CFE25CAB1BA245F89E1158LOPSU598USPIE24T6',
    'staff-Key' : await _prefs.then((value) => value.getString(('staffKey'))!),
    'mode': _mode
  };
  final response = await http.post(Uri.parse('${base}GuruCheckPermission'),
  body: {
  "showFee": ShowFee.toString(),
	"takePNPAttendance": TakePNPAttendance.toString(),
	"takeMemberAttendance": TakeMemberAttendance.toString(),
	"canLogin": CanLogin.toString()},
  headers: _header);
  print('GuruCheckPermission = '+response.body.toString());

  if (response.statusCode == 200){
    CheckPermisson checkPermisson = 
    CheckPermisson.fromJson(jsonDecode(response.body));
    CanLogin = checkPermisson.data!.canLogin;
    IsChanged = checkPermisson.data!.isChanged;
    TakeMemberAttendance = checkPermisson.data!.takeMemberAttendance;
    TakePNPAttendance = checkPermisson.data!.takePNPAttendance;
    ShowFee = checkPermisson.data!.showFee!;
    return checkPermisson;
  } else {return CheckPermisson();}

 }
}
