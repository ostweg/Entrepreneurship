import 'package:bloc/bloc.dart';
import 'package:entre/cubit/cubit_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits():super(InitialState()){
    emit(WelcomeState());
  }
}