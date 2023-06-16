import 'package:flutter/material.dart';
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
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(
              47.36667,
              8.55,
            ),
            zoom: 11),
        onMapCreated: (controller) {
          mapController = controller;
          addMarker('test', LatLng(47.36667, 8.55));
        },
        markers:markers.values.toSet(),
      ),
    );
  }
  addMarker(String id, LatLng location){
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: InfoWindow(
            title: 'Hahaha',
            snippet: 'This is my last resort, suffocation'
        )
    );

    markers[id] = marker;
    setState(() {

    });
  }
}
