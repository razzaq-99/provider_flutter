
import 'package:flutter/material.dart';

class StateFul extends StatefulWidget {
  const StateFul({Key? key}) : super(key: key);

  @override
  State<StateFul> createState() => _StateFulState();
}

class _StateFulState extends State<StateFul> {


  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("StateFul Widget")),
      ),
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
