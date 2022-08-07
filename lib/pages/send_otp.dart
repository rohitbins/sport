import 'package:flutter/material.dart';
import 'package:sport/pages/verify_Otp_page.dart';



class SendOtp extends StatefulWidget {
  const SendOtp({Key? key}) : super(key: key);

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {

  InkWell? inkWell;
  TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Otp"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Text("Logo ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              shadows: [
                Shadow(
                  color: Colors.blue,
                  blurRadius: 10,
                  offset: Offset(05, 05)
                ),
                Shadow(
                  color: Colors.red,
                  blurRadius: 6,
                  offset: Offset(03, 03)
                )
              ]
            ),),

            
            const SizedBox(height: 40),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                   )

                  )
                ),
            ),
           const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: "Academy Code",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
            ),

            const SizedBox(height: 50),
                InkWell(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute (builder: (context) => const VerifyOtp(),));
                },
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 120),
                   child: Container(
                    height: 70,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue,
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 60,vertical: 12),
                      child:  Text("Send OTP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                   ),),
                    ),
                   ),
                  ),
                 ),
            ],
        ),
      ),
    );
  }
}