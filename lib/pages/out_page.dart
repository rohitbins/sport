import 'package:flutter/material.dart';
import 'package:sport/model/customer_list_out.dart';
import 'package:sport/pages/profile.dart';
import 'package:sport/service.dart';

class OutPage extends StatefulWidget {
  const OutPage({Key? key}) : super(key: key);

  @override
  State<OutPage> createState() => _OutPageState();
}

class _OutPageState extends State<OutPage> {
  late CustomerListOut futureCustomerOut;

  @override
  void initState() {
    super.initState();
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
            
            FutureBuilder<CustomerListOut>(
                future: ServiceCall().fetchCustomerOut(),
                builder: (context, AsyncSnapshot<CustomerListOut> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          CustomerOut data = snapshot.data!.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 5,
                              child: SizedBox(
                                height: 100,
                                width: 190,
                                child: Column(children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 15),
                                        child: SizedBox(
                                            height: 40,
                                            width: 80,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.amber.shade600),
                                                onPressed: () {
                                                  ServiceCall()
                                                      .attendanceOut(
                                                          key: data.customerKey)
                                                      .then((value) {
                                                    setState(() {});
                                                  });
                                                },
                                                child: const Text(
                                                  "Out",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                ))),
                                      ),
                                      const SizedBox(width: 50),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          data.name,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(thickness: 1.5, color: Colors.blue),
                                  if (snapshot.data!.data![index].feePending > 0)
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 150),
                                          child: Text(
                                            "FeeDetail :  ${snapshot.data!.data![index].feePending}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        )
                                      ],
                                    )
                                ]),
                              ),
                            ),
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                }
                ),
                const SizedBox(height: 100),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute (builder: (context) => const Profile(),));
                }, child: const Text("Profile"))
          ],
        ),
          );
  }
}
