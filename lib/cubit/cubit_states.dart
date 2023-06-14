import 'package:equatable/equatable.dart';

import '../model/Listing_model.dart';

abstract class CubitStates extends Equatable{}

class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => []; //change when dynamical data is present

}
class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoadedState extends CubitStates{
  LoadedState(this.listings);
  final List<ListingModel> listings;
  @override
  // TODO: implement props
  List<Object> get props => [listings];
}
class DetailState extends CubitStates{
  DetailState(this.listing);
  final ListingModel listing;
  @override
  // TODO: implement props
  List<Object> get props => [listing];
}