import 'package:otp_text_field/otp_field_style.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service.dart';
import '../router.dart';

// ignore: must_be_immutable
class OtpPage extends StatefulWidget {
  OtpPage({Key? key, required this.phoneNumber}) : super(key: key);
  String phoneNumber;
  @override
  State<OtpPage> createState() => _OtpState();
}

class _OtpState extends State<OtpPage> {
  bool isLoading = false;
  bool error = false;
  ServiceCall service = ServiceCall();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(0, 22, 30, 1),
      body: isLoading?Center(child: CircularProgressIndicator(color: Colors.green)):SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 70),
          Image.asset(
            'assets/images/lock.png',
            scale: MediaQuery.of(context).size.width/250,
          ),
          const SizedBox(height: 70),
           Text(
            'OTP  Verification',
            style: TextStyle(
              color: Color.fromRGBO(41, 128, 185, 1),
              fontSize: MediaQuery.of(context).size.width/10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          isLoading? const CircularProgressIndicator():
          Text(
            'Enter OTP code sent to your number',
            style:
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('+91 ',
                  style: TextStyle(
                      color: Color.fromRGBO(41, 128, 185, 1),
                      fontWeight: FontWeight.bold)),
              Text(widget.phoneNumber,
                  style: TextStyle(
                      color: Colors.grey[500], fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 25),
          error
              ? const Text(
                  'Wrong OTP',
                  style: TextStyle(color: Colors.red, fontSize: 25),
                )
              : const SizedBox(),
          const SizedBox(height: 35),
          OTPTextField(
            keyboardType: TextInputType.phone,
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: Colors.white,
              errorBorderColor: Colors.red,
              focusBorderColor: Colors.green,
            ),
            length: 4,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 70,
            style: const TextStyle(fontSize: 40, color: Colors.blueGrey),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onCompleted: (pin) async {
              isLoading = true;
              service.OtpValidatorApi(
                      otp: pin.toString(), phoneNumber: widget.phoneNumber)
                  .then((value) {
                isLoading = false;
                     if (!value.isError) {
                    _prefs.then((_val) {
                    _val.setString('staffKey', value.data!.staffKey!);
                    _val.setString( 'academyLogoURL', value.data!.academyLogoURL!);
                    _val.setString('name', value.data!.name!);
                    _val.setBool("fees", value.data!.showFee!);
                    _val.setBool("isChanged", value.data!.isChanged!);
                    _val.setBool("canLogin", value.data!.canLogin!);
                    _val.setBool("takePNPAttendance", value.data!.takePNPAttendance!);
                    _val.setBool('tekeMemberAttendance', value.data!.takeMemberAttendance!);
                  });
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyRoute()),
                  );
                } else {
                  const Text('');
                }
              });
            },
          ),
        ]),
      ),
    );
  }
}
