import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/personal_sport.dart';
import '../../service.dart';
import '../../utils/constants.dart';

class SportInfo extends StatefulWidget {
  const SportInfo({Key? key, required this.customerKey}) : super(key: key);
  final String customerKey;
  @override
  State<SportInfo> createState() => _SportInfoState();
}

class _SportInfoState extends State<SportInfo> {
  ServiceCall serviceCall = ServiceCall();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PersonalSportModel?>(
          future: serviceCall.fetchProfileData(widget.customerKey),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              SportsInfo info = snapshot.data!.data!.sportsInfo!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      child: Row(children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date of joining:',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                info.dateOfJoining!.isEmpty
                                    ? "N/A"
                                    : DateFormat('yyyy-MM-dd').format(
                                        DateTime.parse(info.dateOfJoining!)),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ])
                      ]),
                    ),
                    const Divider(thickness: 2),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      child: Row(children: [
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
                                info.sport!.isEmpty ? "N/A" : info.sport!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ])
                      ]),
                    ),
                    const Divider(thickness: 2),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                      child: Row(children: [
                        const Icon(Icons.merge_type),
                        const SizedBox(width: 30),
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
                              info.type!.isEmpty ? "N/A" : info.type!,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ]),
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
                                info.category!.isEmpty ? "N/A" : info.category!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                            children: [
                              const Text(
                                'Batch:',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                info.batch!.isEmpty ? "N/A" : info.batch!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                                'FeeType:',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                info.feeType!.isEmpty ? "N/A" : info.feeType!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                                info.speciality!.isEmpty
                                    ? "N/A"
                                    : info.speciality!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                                info.startTime!.isEmpty
                                    ? "N/A"
                                    : info.startTime!,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                                info.totalFee!.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                                info.discount!.toString().isEmpty
                                    ? "N/A"
                                    : info.discount!.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(thickness: 2),
                    ShowFee?Padding(
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
                                info.finalFee!.toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ):SizedBox(),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
