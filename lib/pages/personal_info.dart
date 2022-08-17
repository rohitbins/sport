import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Info"),
      ),
      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Row(
            children:[
              const Icon(Icons.person,
              size: 30,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Name :",
                 style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("Mayank")
               ],
             ),
            ],
          ),
        ),
         const SizedBox(height: 3),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top:3),
           child: Row(
            children: [
              const Icon(Icons.phone,
              size: 30,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                 Text("Contact No :",
                 style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("999999999")
               ],
             ),
            ],
          ),
         ),
         const SizedBox(height: 5),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top: 3),
           child: Row(
            children:[
              const Icon(Icons.calendar_today,
              size: 30),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Date of Birth :",
                 style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                 ),
                ),
                Text("date of birth")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children:[
              const Icon(Icons.person,
              size: 30,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                 Text("Father's Name :",
                 style: TextStyle(
                  fontSize: 15
                 ),
                ),
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top: 3),
           child: Row(
            children: [
              const Icon(Icons.email,
              size: 30),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Email :",
                 style: TextStyle(
                  fontSize: 18
                 ),
                ),
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children: [
              const Text("M/F",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
             const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Gender :",
                 style: TextStyle(
                  fontSize: 18
                 ),
                ),
                Text("Male")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children: [
              const Icon(Icons.home,
              size: 35,),
              const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("Address :",
                 style: TextStyle(
                  fontSize: 18
                 ),
                ),
                Text("Address")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20,top: 3),
           child: Row(
            children:[
              const Icon(Icons.holiday_village,
              size: 35,),
             const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                 Text("State :",
                 style: TextStyle(
                  fontSize: 18
                 ),
                ),
                Text("State")
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top:3),
           child: Row(
            children:[
              const Icon(Icons.location_city,
              size: 35,),
             const  SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: const[
                 Text("City :",
                 style: TextStyle(
                  fontSize: 18
                 ),
                ),
                Text("City")
               ],
             ),
            ],
          ),
         ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
         Padding(
           padding: const EdgeInsets.only(left: 20, top: 3),
           child: Row(
            children: [
             const Icon(Icons.boy,
              size: 35,),
             const SizedBox(width: 30),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children:const [
                 Text("PinCode :",
                 style: TextStyle(
                  fontSize: 18
                 ),
                ),
               ],
             ),
            ],
           ),
          ),
         const SizedBox(height: 5,),
         const Divider(
          thickness: 1.5,
          color: Colors.grey,
        ),
      ],
    ),
    
    );
  }
}