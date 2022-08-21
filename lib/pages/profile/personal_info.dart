import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport/model/personal_sport.dart';

import '../../service.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key, required this.customerKey})
      : super(key: key);
  final String customerKey;
  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  ServiceCall service = ServiceCall();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PersonalSportModel?>(
          future: service.fetchProfileData(widget.customerKey),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              PersonalInfo info = snapshot.data!.data!.personalInfo!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 20),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                          child: Row(
                            children: [
                              const Icon(Icons.person),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Name:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.name!.isEmpty ? "N/A" : info.name!,
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
                              const Icon(Icons.call),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Contact No:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.mobile!.isEmpty ? "N/A" : info.mobile!,
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
                              const Icon(Icons.calendar_month),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Date Of birth:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.dateOfBirth!.isEmpty
                                        ? "N/A"
                                        : DateFormat('yyyy-MM-dd').format(
                                            DateTime.parse(info.dateOfBirth!)),
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
                              const Icon(Icons.person_outline),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'FatherName:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.fatherName!.isEmpty
                                        ? "N/A"
                                        : info.fatherName!,
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
                              const Icon(Icons.email),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.email!.isEmpty ? "N/A" : info.email!,
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
                              info.gender!.isEmpty
                                  ? Row(
                                      children: const [
                                        Icon(Icons.male),
                                        Icon(Icons.female)
                                      ],
                                    )
                                  : info.gender == 'Male'
                                      ? const Icon(Icons.male)
                                      : info.gender == 'Female'
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Gender:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.gender!.isEmpty ? "N/A" : info.gender!,
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
                              const Icon(Icons.home_filled),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Address:',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      info.address!.isEmpty
                                          ? "N/A"
                                          : info.address!,
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
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                          child: Row(
                            children: [
                              const Icon(Icons.holiday_village),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'State:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.state!.isEmpty ? "N/A" : info.state!,
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
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                          child: Row(
                            children: [
                              const Icon(Icons.location_city),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'City:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.city!.isEmpty ? "N/A" : info.city!,
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
                              const Icon(Icons.pin_drop),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pincode:',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    info.pincode!.isEmpty
                                        ? "N/A"
                                        : info.pincode!,
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
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
