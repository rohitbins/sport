import 'package:flutter/material.dart';
import 'package:sport/model/category_batch.dart';
import 'package:sport/pages/Tab_page.dart';
import 'package:sport/service.dart';

class OutPage extends StatefulWidget {
  const OutPage({Key? key}) : super(key: key);

  @override
  State<OutPage> createState() => _OutPageState();
}

class _OutPageState extends State<OutPage> {
  late Future<CategoryAndBatch> futureBatchCategories;

  String? selectedPerson;
  List<Category> sports = [];

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
        title: const Text("Out"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabBarPage(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Filter"),
                    SizedBox(width: 5),
                    Icon(Icons.filter_1_outlined)
                  ],
                )),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                for (var i = 0; i < 1; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 90,
                        width: 300,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: Offset(2, 2))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 5),
                                  child: SizedBox(
                                    height: 40,
                                    width: 90,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.pink),
                                        child: const Text("Out")),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Text(
                                  selectedPerson.toString(),
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 1.5,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
      setState(() {});
    });
  }
}
