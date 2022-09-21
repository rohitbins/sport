// ignore_for_file: prefer_final_fields, unused_field, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/utils/constants1.dart';
// import 'package:sportsb/View/otp.dart';

import '../../model/phone_validator.dart';
import '../../service.dart';
import '../otp/otp_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController numberController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void dispose() {
    numberController.clear();
  }
  final _key = GlobalKey<FormState>();
  bool _empty = false;
  bool _invalid = false;
  bool ready = false;
  bool pressed = false;
  bool isLoading = false;

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


  @override
  void initState() {
    _prefs.then((value) {
      value.clear();
    });
    super.initState();
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
          body: ListView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .18),
             
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Form(
                    key: _key,
                    child: Column(children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset(
                          'assets/images/ffSportsLogoGuru.png',
                          scale: 1.65,
                        ),
                      ),
                      const SizedBox(height: 40),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (_empty) {
                            return 'Please enter Phone Number';
                          }
                          if (_invalid) {
                            return Messg != null
                                ? Messg!.length > 55
                                    ? Messg!.substring(0, 53) +
                                        '\n' +
                                        Messg!.substring(
                                          53,
                                        )
                                    : Messg
                                : "This Number is not Registered Check Number";
                          }
                          return null;
                            },
                            maxLength: 10,
                            decoration: const InputDecoration(
                              counterText: '',
                              errorStyle: TextStyle(
                                color: Colors.red,
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
                      isLoading?const CircularProgressIndicator(color: Colors.blue):
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: pressed
                                ? MaterialStateProperty.all<Color>(Colors.green)
                                : MaterialStateProperty.all<Color>(
                                    Colors.white24)),
                        onPressed: () async {
                          pressed = true;
                          if (_key.currentState!.validate()) {
                            serciceCAll();
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: (isLoading)? const CircularProgressIndicator():const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                       ),
                     ]),
                     ),
                    ),
                  ]),
                  ),
                 ),
                );
               }

  void serciceCAll() async {
    _empty = _phoneController.text.isEmpty;

    await service.PhoneValidatorApi(phoneNumber: _phoneController.text)
        .then((PhoneValidator value) {
      if (!value.isError!) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OtpPage(phoneNumber: _phoneController.text)));
      } else {
        _invalid = true;
      }
      setState(() {});
    });
  }
}
