// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/service.dart';
import '../utils/enums.dart';

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

    int selectedCat = 0;
  int selectedbatch = 0;
  int SelectedId = 0;

  String? selectedPerson;
  List<Category> sports = [];

   String? _selectedTime;
  final List<Batch> batch = [];


  @override
  void initState() {
    super.initState();
    getData();
    futureBatchCategories = Service().fetchBatchCatgories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("In"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                    // border: Border.all(
                    //   // color: Colors.black,
                    // ),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedPerson,
                    onChanged: (value) {
                      setState(() {
                        selectedPerson = value;
                      });
                    },
                    hint: const Text("select"),
                    items: sports.map((e) {
                      return DropdownMenuItem<String>(
                          value: e.category,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(e.category.toString()),
                          ));
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                    // border: Border.all(
                    //   color: Colors.black,
                    // ),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedTime,
                    onChanged: (value) {
                      setState(() {
                        _selectedTime = value;
                      });
                    },
                    hint: const Text("select"),
                    items: batch.map((e) {
                      return DropdownMenuItem<String>(
                          value: e.batch,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Text(e.batch.toString()),
                          ));
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 495,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                for (var i = 0; i < 2; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(2, 2))
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 90,
                        width: 300,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 5),
                                  child: SizedBox(
                                    width: 90,
                                    height: 40,
                                    child: ElevatedButton(
                                        onPressed: (() {}),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        child: const Text("In")),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  selectedPerson.toString(),
                                  style: const TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                            const Divider(
                              thickness: 1.5,
                              color: Colors.blue,
                            ),
                            const Center(
                              child: Text(
                                "Fee Due",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),

      
    );
  }

  void getData() async {
    await Service().fetchBatchCatgories().then((value) {
      sports.addAll(value.data!.categoryList!);
      selectedPerson = sports.first.category;


      batch.addAll(value.data!.batchList!);
      _selectedTime = batch.first.batch;

      setState(() {});
    });
  }
}
