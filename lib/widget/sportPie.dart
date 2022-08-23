import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SportPie extends StatefulWidget {
  SportPie({Key? key, required this.dataSet, required this.colorList})
      : super(key: key);

  Map<String, double> dataSet;
  List<Color> colorList;
  @override
  State<SportPie> createState() => _sportPieState();
}

class _sportPieState extends State<SportPie> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          PieChart(
            dataMap: widget.dataSet,
            colorList: widget.colorList,
            chartRadius: MediaQuery.of(context).size.width / 3,
            legendOptions: const LegendOptions(
              showLegends: true,
            ),
          ),
         
        ],
      ),
    );
  }
}
