import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport/pages/dashboard_page.dart';


class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
      ),
      body: Center(
        child: ListView(
          children: [
           const SizedBox(height: 50),
           const Text("Logo ?",
            textAlign: TextAlign.center,
            style: TextStyle(
            shadows: [
              Shadow(
                color: Colors.blue,
                blurRadius: 10,
                offset: Offset(05, 05)
              ),
              Shadow(
                color: Color.fromARGB(255, 229, 156, 151),
                blurRadius: 6,
                offset: Offset(03, 03)
              )
            ],
              fontWeight: FontWeight.bold,
              fontSize: 50,
              // color: Colors.grey,
            ),
           ),
          const SizedBox(height: 50),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
            for (var i = 0; i < 4; i++)
             Container(
              height: 60,
              width: 50,
              decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none
                ),
                onChanged: (value) {
                  if (value.length == 1){
                    FocusScope.of(context).nextFocus();
                    return;
                  }
                   FocusScope.of(context).previousFocus();
                },
                
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
             ),
            ],
         ),
         const SizedBox(height: 50),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: InkWell(
          onTap: () {
           Navigator.push(context, MaterialPageRoute (builder: (context) => const DashboardPage(),));
          },
          child: Container(
            height: 70,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Verify OTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
          ),
        ),
        ),
        const SizedBox(height: 30),
        const Text("Resend OTP",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.blue
        ),
       ),
            ],
      ),
     ),
    );

  }
}