// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/utils/enums.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key, required this.callBack, required this.data})
      : super(key: key);
  final Function callBack;

  final CategoryAndBatch data;

  @override
  State<TabBarPage> createState() => _TabBarPageState();
} //base class

class _TabBarPageState extends State<TabBarPage> //state class
    with
        SingleTickerProviderStateMixin {
  bool isSelectedbatch = false;
  late Future<CategoryAndBatch> futureBatchCategories;
  late CustomerListData futureCustomerData;
  late TabController _tabController;
  List<String> tabs = [
    SportType.Batch.apiValue,
    SportType.Category.apiValue,
  ];
  bool IsCategoryNull = true;
  bool IsBatchNull = true;
  bool IsCategoryAndBatchNull = true;
  int? selectedCatIndex;
  int? selectedbatchIndex;
  int selectedCatId = 0;
  int selectedbatchId = 0;
  int selectedId = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    IsCategoryAndBatchNull = widget.data.data == null?true:false;

    IsCategoryNull = widget.data.data!.categoryList == null;
    IsBatchNull = widget.data.data!.batchList == null;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: DefaultTabController(
          length: tabs.length,
          child: Column(children: [
            Container(
              color: const Color.fromRGBO(6, 41, 74, 1),
              constraints: const BoxConstraints.expand(height: 50),
              child: TabBar(
                  indicatorColor: Colors.blue.shade200,
                  isScrollable: false,
                  controller: _tabController,
                  tabs: [...tabs.map((e) => Tab(text: e))]),
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
                  IsBatchNull? const Center(child: Text('No Batch Available, Please contact Admin',style: TextStyle(color: Colors.black),)): ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.data.data!.batchList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Batch data = widget.data.data!.batchList![index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 3),
                      child: InkWell(
                        onTap: () {
                          setState(() => selectedbatchIndex = index);
                          selectedbatchId = data.id;
                        },
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          data.sportLogo != ""
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 5, bottom: 5),
                                      child: Image.network(
                                        data.sportLogo,
                                        height: 45,
                                        width: 45,
                                      ),
                                    )
                                  : const Padding(
                                      padding: EdgeInsets.only(
                                          left: 23, top: 5, bottom: 5),
                                      child: Icon(
                                        Icons.sports,
                                        size: 40,
                                      ),
                                    ),
                              const SizedBox(width: 20),
                              Expanded(child: Text(data.batch)),
                            
                              if (selectedbatchIndex == index)
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(right: 30),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 10,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                 IsCategoryNull? const Center(child: Text('No Category Available, Please contact Admin',style: TextStyle(color: Colors.black),)):ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.data.data!.categoryList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Category data = widget.data.data!.categoryList![index];

                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 3),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedCatIndex = index;
                            selectedCatId = data.id;
                          });
                        },
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                data.sportLogo != ""
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 5, bottom: 5),
                                        child: Image.network(
                                          data.sportLogo,
                                          height: 45,
                                          width: 45,
                                        ),
                                      )
                                    : const Padding(
                                        padding: EdgeInsets.only(
                                            left: 25, top: 3, bottom: 3),
                                        child: Icon(
                                          Icons.sports,
                                          size: 40,
                                        ),
                                      ),
                                const SizedBox(width: 20),
                                Expanded(child: Text(data.category)),
                                
                                if (selectedCatIndex == index)
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 30),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 10,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  )
                              ]),
                        ),
                      ),
                    );
                  }),
            ])),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.callBack(selectedCatId, selectedbatchId);
          Navigator.pop(context);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
