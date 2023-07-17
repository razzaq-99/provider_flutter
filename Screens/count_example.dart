import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Providerrr/count_foundation.dart';
import 'package:provider_flutter/provider.dart';
import 'package:flutter/foundation.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider =
        Provider.of<CountFoundationProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider =
        Provider.of<CountFoundationProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Count Example Provider")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountFoundationProvider>(
                builder: (context, value, child) {
              return Text(value.count.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold));
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            countProvider.setCount();
          }),
    );
  }
}
