import 'package:entre/cubit/app_cubit_logics.dart';
import 'package:entre/cubit/app_cubits.dart';
import 'package:entre/pages/detail_page.dart';
import 'package:entre/pages/main_page.dart';
import 'package:entre/pages/start_page.dart';
import 'package:entre/services/data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(
          data: DataServices(),
        ),
        child:AppCubitLogics(),
      )
    );
  }
}
