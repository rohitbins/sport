import 'package:flutter/material.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/pages/customer_Page.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/enums.dart';

import '../widget/slot_card.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late Future<CategoryAndBatch> futureBatchCategories;
  late CustomerListData futureCustomerData;
  late TabController _tabController;
  List<String> tabs = [
    SportType.Category.apiValue,
    SportType.Batch.apiValue,
  ];
  int selectedCat = 0;
  int selectedbatch = 0;
  int SelectedId = 0;
  @override
  void initState() {
    super.initState();
    futureBatchCategories = Service().fetchBatchCatgories();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tab Page"),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: tabs.length,
          child: Column(children: [
            Container(
              color: const Color.fromARGB(255, 109, 176, 231),
              constraints: const BoxConstraints.expand(height: 50),
              child: TabBar(
                  indicatorColor: Colors.blue.shade900,
                  isScrollable: false,
                  controller: _tabController,
                  tabs: [...tabs.map((e) => Tab(text: e))]),
            ),
            Expanded(
              child: FutureBuilder<CategoryAndBatch>(
                  future: futureBatchCategories,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TabBarView(controller: _tabController, children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                snapshot.data!.data!.categoryList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Category data =
                                  snapshot.data!.data!.categoryList![index];

                              return SlotCard(
                                  title: data.category.split(':').first,
                                  subTitle: data.category.split(':').last,
                                  selectedbatch: selectedCat == index,
                                  callBack: () {
                                    setState(() => selectedCat = index);
                                    SelectedId = data.id;
                                  });
                            }),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data!.batchList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Batch data =
                                  snapshot.data!.data!.batchList![index];

                              return SlotCard(
                                  title: data.batch!.split(':').first,
                                  subTitle: data.batch!.split(':').last,
                                  selectedbatch: selectedbatch == index,
                                  callBack: () {
                                    setState(() => selectedbatch = index);
                                    SelectedId = data.id!;
                                  });
                            })
                      ]);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('selected:${_tabController.index}:$SelectedId');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerPage(
                      category: _tabController.index == 0 ? SelectedId : 0,
                      batch: _tabController.index == 1 ? SelectedId : 0),
                ));
          },
          child: const Icon(Icons.search),
        ));
  }
}
