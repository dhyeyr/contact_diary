//
// import 'package:contact_diary/theme.dart';
// import 'package:flutter/material.dart';
//
// import 'View/contect_home.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isDark = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//         theme: lightTheme,
//         darkTheme: darkTheme,
//         debugShowCheckedModeBanner: false,
//         themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
//         home: HomePage(
//           changeTheme: () {
//             isDark = !isDark;
//             setState(() {});
//           },
//         ));
//   }
// }


// ignore_for_file: prefer_const_constructors

import 'package:contact_diary/provider/contact_provider.dart';
import 'package:contact_diary/provider/theme_provider.dart';
import 'package:contact_diary/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'View/add_contect.dart';
import 'View/contect_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => HomePage(),
            "ContactSave": (context) => ContactSave(),
          },
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: Provider.of<ThemeProvider>(context).isDark ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
    //
  }
}