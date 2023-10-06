import 'dart:js';

import 'package:provider_todo/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/provider/provider_page.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context)=>Provider_class(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const TodoList(),

    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ListProvider(),
    );
  }
}

