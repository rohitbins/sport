import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/model/category_batch.dart';
import 'package:flutter_pie_chart/model/customer_list.dart';
import 'package:flutter_pie_chart/pages/customer_Page.dart';
import 'package:flutter_pie_chart/service.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>  with SingleTickerProviderStateMixin {

  late Future<CategoryAndBatch>futureBatchCategories;
  late CustomerListData futureCustomerData;
  late TabController _tabController;
  int selectedCat=0;
  int selectedbatch = 0;
  
  @override
 void initState(){
  super.initState();
  futureBatchCategories = fetchBatchCatgories();
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
        length: 2, 
      
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 109, 176, 231),
              constraints: const BoxConstraints.expand(height: 50),
              child:  TabBar(
                indicatorColor: Colors.red,
                isScrollable: false,
                
                controller: _tabController,
                tabs: const[
                  Tab(text: "Category",),
                  Tab(text: "Batch",)
                ]),
            ),
            Expanded(child: SizedBox(
              child: TabBarView(
                controller: _tabController,
                children: [
                FutureBuilder<CategoryAndBatch>(
                  future: futureBatchCategories,
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.categoryList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedCat = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              color: selectedCat==index?Colors.grey:null,
                              height: 32,
                              width: MediaQuery.of(context).size.width,
                              child: Text(snapshot.data!.data!.categoryList![index].category.toString()),
                            ),
                          );
                        });
                    }else if (snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
                FutureBuilder<CategoryAndBatch>(
                  future: futureBatchCategories,
                  builder: (context, snapshot) {
                    if (snapshot.hasData){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.batchList!.length,
                        itemBuilder: (BuildContext context, int index){
                         return InkWell(onTap: (){
                  setState(() {
                    selectedbatch=index;
                  });
                         },
                           child: Container(
                            height: 32,
                         color: selectedbatch==index? Colors.grey:null,
                           padding: const EdgeInsets.all(8.0),
                            width: MediaQuery.of(context).size.width,
                            child: Text(snapshot.data!.data!.batchList![index].batch!),
                           ),
                         );
                        });
                    }else if (snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return const Center(child: CircularProgressIndicator());
                  })
              ]),
            )),

            ElevatedButton(onPressed: (){
              print('selected:${_tabController.index}');
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerPage(),));
            }, child: const Text("Next"))
          ],
        )),
    );
  }
}