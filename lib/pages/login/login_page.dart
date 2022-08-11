// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:sportsb/View/otp.dart';

import '../../model/phone_validator.dart';
import '../../service.dart';
import '../../utils/constants.dart';
import '../otp/otp_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  bool _empty = false;
  bool _invalid = false;
  bool ready = false;
  bool pressed = false;

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Do you want to exit app?'),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('No')),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Yes')),
            ],
          ));
  ServiceCall service = ServiceCall();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(0, 22, 30, 1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Form(
                  key: _key,
                  child: Column(children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/ff_sports_logo.png',
                      scale: 1.5,
                    ),
                    const SizedBox(height: 130),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        child: TextFormField(
                          smartDashesType: SmartDashesType.enabled,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.length != 10
                                ? 'Please enter Phone Number'
                                : null;
                          },
                          maxLength: 10,
                          decoration: const InputDecoration(
                            counterText: '',
                            errorStyle: TextStyle(
                              color: Colors.orange,
                              fontSize: 13,
                            ),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 16,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            hintText: 'Enter number here',
                            hintStyle: TextStyle(color: Colors.white),
                            labelText: 'Phone Number',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor: pressed
                              ? MaterialStateProperty.all<Color>(Colors.black)
                              : MaterialStateProperty.all<Color>(
                                  Colors.white24)),
                      onPressed: () async {
                        pressed = true;
                        if (_key.currentState!.validate()) {
                          _empty = _phoneController.text.isEmpty;

                          await service.PhoneValidatorApi(
                                  phoneNumber: _phoneController.text)
                              .then((PhoneValidator value) {
                            if (value.isError!) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpPage(
                                          phoneNumber: _phoneController.text)));
                            } else {
                              _invalid = true;
                            }
                            setState(() {});
                          });
                        }
                        // api calling
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
