// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/pages/Tab_page.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/constants.dart';
import '../model/request/customer_data.dart';

import '../utils/enums.dart';
import 'customer_Page.dart';

class InPage extends StatefulWidget {
  const InPage({Key? key}) : super(key: key);

  @override
  State<InPage> createState() => _InPageState();
}

class _InPageState extends State<InPage> {
  late Future<CategoryAndBatch> futureBatchCategories;
  CustomerListData futureCustomerData = CustomerListData();

 bool isFutureCustomerData = false;
   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
       bool showFees = false;

  List<String> CatBatch = [
    SportType.Category.apiValue,
    SportType.Batch.apiValue,
  ];

  int SelectedId = 0;

  String? selectedPerson;
  List<Category> sports = [];

  final List<Batch> batch = [];
  int selecteCatId = 0;
  int selectedBatchId = 0;
  CategoryAndBatch categoryAndBatch = CategoryAndBatch();


  @override
  void initState() {
    super.initState();
    getBatchCatgories();
    getCustomerList(0, 0);
    getData();
  }

  void getBatchCatgories() async {
    categoryAndBatch = await ServiceCall().fetchBatchCatgories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    isFutureCustomerData = categoryAndBatch.data  == null;
    print('futureCustomerData = '+futureCustomerData.data.toString());
    // print('categoryAndBatch'+categoryAndBatch.data!.batchList.toString());
    // print(categoryAndBatch.data!.batchList);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TabBarPage(
                          data: categoryAndBatch,
                          callBack: (category, batc) {
                            futureCustomerData.data!.clear();
                            selecteCatId = category;
                            selectedBatchId = batc;
                            setState(() {});
                            getCustomerList(category, batc);
                          }),
                    ));
              },
              icon: const Icon(Icons.filter_alt)),
        ],
        title: const Text("In"),
        centerTitle: true,
        leading: Container(),
      ),
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        (categoryAndBatch.data == null)?SizedBox():
           SizedBox(
            height: MediaQuery.of(context).size.height * .06,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                categoryAndBatch.data!.batchList!.isEmpty?SizedBox():
                Chip(
                  backgroundColor: Colors.white,
                  avatar: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check_circle, color: Colors.white),
                  ),
                  label: Text((categoryAndBatch.data!.batchList!.firstWhere(
                      (element) => element.id == selectedBatchId)).batch,),
                ),
                categoryAndBatch.data!.categoryList!.isEmpty?SizedBox():
                Chip(
                  backgroundColor: Colors.white,
                  avatar: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check_circle, color: Colors.white),
                  ),
                  label: Text((categoryAndBatch.data!.categoryList!
                          .firstWhere((element) => element.id == selecteCatId))
                      .category),
                ),
              ],
            ),
          ),
const Divider(),
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: CustomerPage(customerListData: futureCustomerData)),
      ]),
    );
  }

  void getData() async {
    ServiceCall().fetchBatchCatgories().then((value) {
      sports.addAll(value.data!.categoryList!);
      selectedPerson = sports.first.category;
      batch.addAll(value.data!.batchList!);
      setState(() {});
    });
  }

  void getCustomerList(int _categoryId, int _batchId) async {
    await ServiceCall()
        .fetchCustomerData(
            customerDataRequest: CustomerDataRequest(
             batchId: '$_batchId', categoryId: '$_categoryId'))
        .then((value) {
      setState(() {
        futureCustomerData = value;
      });
    });
  }
}
