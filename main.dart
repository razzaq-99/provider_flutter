import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Providerrr/count_foundation.dart';
import 'package:provider_flutter/Providerrr/example_two_provider.dart';
import 'package:provider_flutter/Providerrr/favourite_provider/favorite_provider.dart';
import 'package:provider_flutter/Providerrr/theme_changer_provider.dart';
import 'package:provider_flutter/Screens/count_example.dart';
import 'package:provider_flutter/Screens/dark_theme.dart';
import 'package:provider_flutter/Screens/example_two.dart';
import 'package:provider_flutter/Screens/favorite/favorite_app.dart';
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
    // final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountFoundationProvider()),
          ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChangerProvider()),
        ],
        child: Builder(builder: (context) {
          final themeChanger = Provider.of<ThemeChangerProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.deepOrange,
            ),
            darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.teal,
                ),
                brightness: Brightness.dark),
            home: const DarkTheme(),
          );
        }));
  }
}
