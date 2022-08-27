import 'package:flutter/material.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/model/customer_list.dart';
import 'package:sport/service.dart';
import 'package:sport/utils/enums.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key, required this.callBack}) : super(key: key);
  final Function callBack;
  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  bool isSelectedbatch = false;
  late Future<CategoryAndBatch> futureBatchCategories;
  late CustomerListData futureCustomerData;
  late TabController _tabController;
  List<String> tabs = [
    SportType.Category.apiValue,
    SportType.Batch.apiValue,
  ];
  int selectedCatIndex = 0;
  int selectedbatchIndex = 0;
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
    return Scaffold(
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
              child: FutureBuilder<CategoryAndBatch>(
                  future: ServiceCall().fetchBatchCatgories(),
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

                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 3),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCatIndex = index;
                                      selectedCatId = data.id;
                                    });
                                  },
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                       data.sportLogo!=""? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                          child: Image.network(
                                            data.sportLogo,
                                            height: 45,
                                            width: 45,
                                          ),
                                        ):const Padding(
                                          padding: EdgeInsets.only(left: 25,top: 3,bottom: 3),
                                          child:Icon(Icons.sports,
                                          size: 40,),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Text(
                                            data.category) 
                                          ),
                                        // Expanded(
                                        //   child: Text(data.id.toString())
                                        //   ),
                                        if (selectedCatIndex == index)
                                          Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                right: 30),
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
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data!.batchList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              Batch data =
                                  snapshot.data!.data!.batchList![index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 3),
                                child: InkWell(
                                  onTap: () {
                                    setState(() => selectedbatchIndex = index);
                                    selectedbatchId = selectedbatchId = data.id;
                                  },
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        data.sportLogo!=""?Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                          child: Image.network(
                                            data.sportLogo,
                                            height: 45,
                                            width: 45,
                                          ),
                                        ): const Padding(
                                          padding: EdgeInsets.only(left: 23,top: 5,bottom: 5),
                                          child: Icon(Icons.sports,
                                          size: 40,),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Text(
                                            data.batch )
                                          ),
                                         
                                        
                                        if (selectedbatchIndex == index)
                                          Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                right: 30),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int category = _tabController.index == 0 ? selectedCatId : 0;
          int batch = _tabController.index == 1 ? selectedbatchId : 0;

          widget.callBack(category, batch);
          Navigator.pop(context);
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
