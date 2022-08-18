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
    getData();
    futureBatchCategories = ServiceCall().fetchBatchCatgories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TabBarPage(callBack: (category, batc) {
                          callForData() {
                            selecteCat = category;
                            selectedBatch = batc;
                          }
                        }),
                      )).whenComplete(() async {
                    await ServiceCall()
                        .fetchCustomerData(
                            customerDataRequest: CustomerDataRequest(
                                batchId: '$selectedBatch',
                                categoryId: '$selectedCat'))
                        .then((value) {
                      setState(() {
                        futureCustomerData = value;
                        filtered = true;
                      });
                    });
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("Filter"), Icon(Icons.filter_alt)],
                )),
        ],
        title: const Text("In"),
        centerTitle: true,
        leading: Container(),
       ),
      body: ListView(
        children: [
          
          if (filtered)
          SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width * .08,
              child: CustomerPage(customerListData: futureCustomerData)),
      ]),
    );
  }

  void getData() async {
    await ServiceCall().fetchBatchCatgories().then((value) {
      sports.addAll(value.data!.categoryList!);
      selectedPerson = sports.first.category;

      batch.addAll(value.data!.batchList!);
      _selectedTime = batch.first.batch;

      setState(() {});
    });
  }
}
