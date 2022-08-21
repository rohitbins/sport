// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/pages/Tab_page.dart';
import 'package:sport/service.dart';
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
  late CustomerListData futureCustomerData;

  List<String> CatBatch = [
    SportType.Category.apiValue,
    SportType.Batch.apiValue,
  ];
  bool filtered = false;
  int selectedCat = 0;
  int selectedbatch = 0;
  int SelectedId = 0;

  String? selectedPerson;
  List<Category> sports = [];

  String? _selectedTime;
  final List<Batch> batch = [];
  int selecteCat = 0;
  int selectedBatch = 0;

  @override
  void initState() {
    super.initState();
    getCustomerList(0, 0);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TabBarPage(callBack: (category, batc) {
                        futureCustomerData.data!.clear();
                        setState(() {});
                        getCustomerList(category, batc);
                      }),
                    ));
              },
              icon: Icon(Icons.filter_alt)),
        ],
        title: const Text("In"),
        centerTitle: true,
        leading: Container(),
      ),
      body: ListView(children: [
        if (filtered)
          SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width * .08,
              child: CustomerPage(customerListData: futureCustomerData)),
      ]),
    );
  }

  void getData() async {
    ServiceCall().fetchBatchCatgories().then((value) {
      sports.addAll(value.data!.categoryList!);
      selectedPerson = sports.first.category;
      batch.addAll(value.data!.batchList!);
      _selectedTime = batch.first.batch;
      setState(() {});
    });
  }

  void getCustomerList(int _categoryId, int _batchId) {
    ServiceCall()
        .fetchCustomerData(
            customerDataRequest: CustomerDataRequest(
                batchId: '$_batchId', categoryId: '$_categoryId'))
        .then((value) {
      setState(() {
        futureCustomerData = value;
        filtered = true;
      });
    });
  }
}
