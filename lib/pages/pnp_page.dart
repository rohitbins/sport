import 'package:flutter/material.dart';

class PnpPage extends StatefulWidget {
  const PnpPage({Key? key}) : super(key: key);

  @override
  State<PnpPage> createState() => _PnpPageState();
}

class _PnpPageState extends State<PnpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pnp"),
        centerTitle: true,
      ),
    );
  }
}