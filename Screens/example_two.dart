import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Providerrr/example_two_provider.dart';

class ExampleTwoScreen extends StatefulWidget {
  const ExampleTwoScreen({Key? key}) : super(key: key);

  @override
  State<ExampleTwoScreen> createState() => _ExampleTwoScreenState();
}

class _ExampleTwoScreenState extends State<ExampleTwoScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExampleTwoProvider>(context, listen: true);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Example Provider")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleTwoProvider>(builder: (context, value, child) {
            return Slider(
                value: value.value,
                onChanged: (val) {
                  min:
                  0;
                  max:
                  1;

                  value.setValue(val);
                });
          }),
          Consumer<ExampleTwoProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    // width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text(
                        "Container 1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    // width: 120,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: const Center(
                      child: Text(
                        "Container 2",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
