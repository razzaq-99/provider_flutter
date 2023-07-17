import 'package:flutter/material.dart';

class StateFul extends StatefulWidget {
  const StateFul({Key? key}) : super(key: key);

  @override
  State<StateFul> createState() => _StateFulState();
}

class _StateFulState extends State<StateFul> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("StateFul Widget")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        onPressed: () {
          count++;
          print(count++);
          setState(() {});
        },

      ),
    );
  }
}
