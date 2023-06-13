import 'package:entre/cubit/app_cubits.dart';
import 'package:entre/cubit/cubit_states.dart';
import 'package:entre/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogics();
}

class _AppCubitLogics extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
          if(state is WelcomeState)
            {
              return StartPage();
            }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
