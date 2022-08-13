import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../utils/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Future<AllInfo> getProfile(String KEY) async {
  //   final response = await http.post(
  //     Uri.parse("http://api.sportsb.co.in/api/CustomerProfile"),
  //     headers: <String, String>{
  //       'customer-key': KEY,
  //       'ContentType': 'application/json',
  //       'Content-Type': 'application/json'
  //     },
  //     body: jsonEncode(
  //       {"Indx": "0", "IdForNew": "0"},
  //     ),
  //   );
  //   var json = jsonDecode(response
  //       .body); //jsonDecode() returns a _InternalLinkedHashMap<String, dynamic>

  //   var profile = json;
  //   // print(json);
  //   var Data = profile["Data"];
  //   var pro = Data["PersonalInfo"];
  //   var spo = Data["SportsInfo"];
  //   // print(aList.runtimeType);
  //   // print(Data);

  //   PersonalInfo Personal = PersonalInfo(
  //       pro["DateOfBirth"],
  //       pro["Name"],
  //       pro["FatherName"],
  //       pro["Email"],
  //       pro["Mobile"],
  //       pro["Gender"],
  //       pro["Address"],
  //       pro["State"],
  //       pro["City"],
  //       pro["Pincode"]);

  //   SportsInfo Sports = SportsInfo(
  //     spo["DateOfJoining"],
  //     spo["Sport"],
  //     spo["Type"],
  //     spo["Category"],
  //     spo["Batch"],
  //     spo["FeeType"],
  //     spo["Speciality"],
  //     spo["StartTime"],
  //     spo["TotalFee"],
  //     spo["Discount"],
  //     spo["FinalFee"],
  //   );
  //   AllInfo all = AllInfo(Personal, Sports);
  //   return all;
  // }

  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    return colornew;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(41, 128, 185, 1),
          title: const Text('Profile'),
          bottom: const TabBar(
            tabs: [Tab(text: 'Personal Info'), Tab(text: 'Sport Info')],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            FutureBuilder<AllInfo>(
                // future: getProfile(KEY!),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.width / 20),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Name:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.Name'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.Name'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.call),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Contact No:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.Mobile'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.Mobile'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_month),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Date Of birth:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.DateOfBirth'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : DateFormat('yyyy-MM-dd').format(
                                                  DateTime.parse('snapshot.data!.P.DateOfBirth')),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person_outline),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'FatherName:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.FatherName'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.FatherName'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.email),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Email:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.Email'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.Email'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                         0==0
                                        ? Row(
                                            children: const [
                                              Icon(Icons.male),
                                              Icon(Icons.female)
                                            ],
                                          )
                                        : 0==0
                                            ? const Icon(Icons.male)
                                            : 'snapshot.data!.P.Gender'
                                                        .toString() ==
                                                    'Female'
                                                ? const Icon(Icons.female)
                                                : Row(
                                                    children: const [
                                                      Icon(Icons.male),
                                                      Icon(Icons.female)
                                                    ],
                                                  ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Gender:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.Gender'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.Gender'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.home_filled),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Address:',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            'snapshot.data!.P.Address'
                                                    .toString()
                                                    .isEmpty
                                                ? "N/A"
                                                : 'snapshot.data!.P.Address'
                                                    .toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.holiday_village),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'State:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.State'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.State'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_city),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'City:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.City'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.City'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.pin_drop),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Pincode:',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'snapshot.data!.P.Pincode'
                                                  .toString()
                                                  .isEmpty
                                              ? "N/A"
                                              : 'snapshot.data!.P.Pincode'
                                                  .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Divider(thickness: 2),
                            ],
                          ),
                          // SizedBox(height: 5),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            FutureBuilder<AllInfo>(
                // future: getProfile(KEY!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.width / 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                     Text(
                                      'Date of joining:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                   SizedBox(
                                      height: 2,
                                    ),
                                    // Text(
                                    //   'snapshot.data!.S.DateOfJoining'
                                    //           .toString()
                                    //           .isEmpty
                                    //       ? "N/A"
                                    //       : DateFormat('yyyy-MM-dd').format(
                                    //           DateTime.parse('snapshot'
                                    //               .data!.S.DateOfJoining)),
                                    //   style: const TextStyle(
                                    //       fontSize: 18,
                                    //       fontWeight: FontWeight.bold),
                                    // )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.sports_baseball),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sport:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.Sport'
                                      .toString()
                                      .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.Sport'.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.merge_type),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Type:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.Type'.toString().isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.Type.toString()',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.category),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Category:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.Category'
                                              .toString()
                                              .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.Category'
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.batch_prediction),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const[
                                     Text(
                                      'Batch:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                     SizedBox(
                                      height: 2,
                                    ),
                                    // Text(
                                    //   'snapshot.data!.S.Batch'
                                    //   .toString()
                                    //   .isEmpty,
                                    //       ? "N/A"
                                    //       : 'snapshot.data!.S.Batch'
                                    //       .toString(),
                                    //   style: const TextStyle(
                                    //       fontSize: 18,
                                    //       fontWeight: FontWeight.bold),
                                    // )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.currency_rupee),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'FeeType:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.FeeType'
                                              .toString()
                                              .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.FeeType.toString()',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.star_border_outlined),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Speciality:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.Speciality'
                                              .toString()
                                              .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.Speciality'
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.watch_later_outlined),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'StartTime:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.StartTime'
                                              .toString()
                                              .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.StartTime'
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.currency_rupee),
                                const SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'TotalFee:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.TotalFee'
                                              .toString()
                                              .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.TotalFee'
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.discount_outlined),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Discount:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.Discount'
                                              .toString()
                                              .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.Discount'
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.currency_rupee),
                                const SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'FinalFee:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'snapshot.data!.S.FinalFee'
                                              .toString()
                                              .isEmpty
                                          ? "N/A"
                                          : 'snapshot.data!.S.FinalFee'
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(thickness: 2),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class AllInfo {
  PersonalInfo P;
  SportsInfo S;

  AllInfo(this.P, this.S);
}

class PersonalInfo {
  String DateOfBirth;
  String Name;
  String FatherName;
  String Email;
  String Mobile;
  String Gender;
  String Address;
  String State;
  String City;
  String Pincode;

  PersonalInfo(
      this.DateOfBirth,
      this.Name,
      this.FatherName,
      this.Email,
      this.Mobile,
      this.Gender,
      this.Address,
      this.State,
      this.City,
      this.Pincode);
}

class SportsInfo {
  String DateOfJoining;
  String Sport;
  String Type;
  String Category;
  String Batch;
  String FeeType;
  String Speciality;
  String StartTime;
  int TotalFee;
  int Discount;
  int FinalFee;

  SportsInfo(
    this.DateOfJoining,
    this.Sport,
    this.Type,
    this.Category,
    this.Batch,
    this.FeeType,
    this.Speciality,
    this.StartTime,
    this.TotalFee,
    this.Discount,
    this.FinalFee,
  );
}
