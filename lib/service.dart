import 'dart:convert';
import 'dart:async';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:http/http.dart' as http;

Future<CategoryAndBatch> fetchBatchCatgories() async {
  final response = await http.post(Uri.parse("http://api.sportsb.co.in/api/StaffAcademyCategoryAndBatch"),body: null);

  if (response.statusCode == 200){
    CategoryAndBatch categoryAndBatch =CategoryAndBatch.fromJson(jsonDecode(response.body));
    return categoryAndBatch;
  }else {
    throw Exception('failed to load BatchCategories');
  }
}


Future<CustomerListData>fetchCustomerData({required int id}) async {
  final response = await http.post(Uri.parse("http://api.sportsb.co.in/api/CustomerListByBatchAndCategory"),body:  {
    "batchId": "0",
    "categoryId": "0"
}, headers: {"staff-key": '$id', "ContentType": "application/json"});

  if (response.statusCode == 200){

    CustomerListData customerListData =CustomerListData.fromJson(jsonDecode(response.body));
    return customerListData;
  }else {
    throw Exception('failed to load CustomerList');
  }
}