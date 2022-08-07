
import 'package:flutter/material.dart';
import 'package:flutter_pie_chart/pages/pop_page.dart';
import 'package:flutter_pie_chart/service.dart';
import '../model/category_batch.dart';


class DownPage extends StatefulWidget {
  const DownPage({Key? key}) : super(key: key);

  @override
  State<DownPage> createState() => _DownPageState();
}

class _DownPageState extends State<DownPage> {


 late Future<CategoryAndBatch> futureBatchCategories;

  String? _selectedTime;
  final List<Batch> sport = [];

  
  String? selectedVelue;
 final List<Category> items = [];
  
  @override
  void initState(){
    super.initState();
   getData();
   futureBatchCategories = fetchBatchCatgories();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdwon Menu"),
        centerTitle: true,
      ),
      body: 
       Center(
         child: Column(
         children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 203, 203),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  width: 1
                )
              ),
              
              child: Center(
                child: DropdownButton<String>(
                  value: selectedVelue,
                   onChanged: (value){
                    setState(() {
                      selectedVelue = value;
                    });
                   },
                 hint: const Text("Select"),
                 items: items.map((e) {
                  return DropdownMenuItem<String>(
                    value: e.category,
                    child: Text(e.category.toString()));
                 }).toList(),
                  ),
              ),
            ),
          ),

         const SizedBox(height: 10),
         Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 213, 203, 203),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
              width: 1
            )
          ),
           child: Center(
            child: DropdownButton<String>(
              value: _selectedTime,
              onChanged: (value) {
                setState(() {
                  _selectedTime = value;
                });
              },
              hint: const Text("Select2"),
              items: sport.map((e) {
                return DropdownMenuItem<String>(
                  value: e.batch.toString(),
                  child: Text(e.batch.toString()));
              }).toList(),
            ),
           ),
          ),
        

         ElevatedButton(onPressed: (() {
          Navigator.push(context, MaterialPageRoute (builder: (context) => const PopPage(),));
         }), child: const Text("Ok"))
     ],
    ),
   ),
  );
  }
  
  void getData() async{

   await fetchBatchCatgories().then((value) {
     
       items.addAll(value.data!.categoryList!);
       selectedVelue = items.first.category;
       
       sport.addAll(value.data!.batchList!);
       _selectedTime = sport.first.batch;

       setState(() {
            
      });
     }
    );
    
  }
}