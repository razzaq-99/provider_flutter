import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Providerrr/count_foundation.dart';
import 'package:provider_flutter/Providerrr/example_two_provider.dart';
import 'package:provider_flutter/Screens/count_example.dart';
import 'package:provider_flutter/Screens/example_two.dart';
import 'package:provider_flutter/home_screen.dart';
import 'package:provider_flutter/provider.dart';
import 'package:provider_flutter/stateful_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountFoundationProvider()),
        ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ExampleTwoScreen(),
      ),
    );
  }
}
