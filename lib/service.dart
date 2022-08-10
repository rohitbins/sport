import 'dart:convert';
import 'dart:async';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:http/http.dart' as http;
import 'package:sport/utils/enums.dart';

import 'model/request/customer_data.dart';

class Service {
  String base = 'http://api.sportsb.co.in/api/';
  Map<String, String> headers = {
    'staff-key':'iIbakR80ZzmJo8mnRsd8vNN3LOjt1C/FQ7A2kbD1flA=',
'ContentType':'application/json'
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
}
