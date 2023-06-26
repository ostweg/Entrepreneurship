import 'package:entre/cubit/app_cubits.dart';
import 'package:entre/cubit/cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late GoogleMapController mapController;
  Map<String, Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
          if(state is LoadedState){
            var listings = state.listings;
            return Scaffold(
              body: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              47.36667,
                              8.55,
                            ),
                            zoom: 11),
                        onMapCreated: (controller) {
                          mapController = controller;
                          for(var i in listings){
                            addMarker(i.name, LatLng(i.latitude, i.longitude),i.name,i.description.substring(0,80)+"...");
                          }
                        },
                        markers: markers.values.toSet(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20,top:20),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search by name'),
                        ),
                      )
                    ],
                  )),
            );
          }else{
            return Container();
          }
        },
      )
      ),
    );
  }

  addMarker(String id, LatLng location,String title, String description) {
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: InfoWindow(
            title: title, snippet: description));

    markers[id] = marker;
    setState(() {});
  }
}
