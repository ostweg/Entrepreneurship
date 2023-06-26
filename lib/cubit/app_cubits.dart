import 'package:bloc/bloc.dart';
import 'package:entre/cubit/cubit_states.dart';
import 'package:entre/services/data_services.dart';

import '../model/Listing_model.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}):super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final listings;

  void getData()async{
    try {
      emit(LoadingState());
      listings = await data.getJsonData();
      emit(LoadedState(listings));
    }catch(e){

    }
  }
  detailPage(ListingModel listing){
    emit(DetailState(listing));
  }
  goHome(){
    emit(LoadedState(listings));
  }
  loadData(){
    emit(LoadedState(listings));
  }
}