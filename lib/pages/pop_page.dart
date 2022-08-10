import 'package:flutter/material.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/pages/Tab_page.dart';

import 'package:sport/service.dart';

class PopPage extends StatefulWidget {
  const PopPage({Key? key}) : super(key: key);

  @override
  State<PopPage> createState() => _PopPageState();
}

class _PopPageState extends State<PopPage> {
  late Future<CategoryAndBatch> futureBatchCategories;

  List<Category> sports = [];

  @override
  void initState() {
    super.initState();
    futureBatchCategories = ServiceCall().fetchBatchCatgories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popup"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 2,
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height / 1,
                              width: MediaQuery.of(context).size.width,
                              child: FutureBuilder<CategoryAndBatch>(
                                future: futureBatchCategories,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        itemCount: snapshot
                                            .data!.data!.categoryList!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
                                            elevation: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: SizedBox(
                                                height: 30,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Text(snapshot
                                                    .data!
                                                    .data!
                                                    .categoryList![index]
                                                    .category
                                                    .toString()),
                                              ),
                                            ),
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return const CircularProgressIndicator();
                                },
                              )),
                        );
                      });
                },
                child: const Text("Category List")),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabBarPage(),
                    ));
              },
              child: const Text("Press Here"))
        ],
      ),
    );
  }
}
