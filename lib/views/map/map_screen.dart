import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("1"),
      position: LatLng(31.15564, 30.122236),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        polylines: {
          Polyline(
            polylineId: PolylineId("1"),
            color: Colors.blue,
            points: [
              LatLng(31.15564, 30.122236),
              LatLng(31.5, 30.7),
            ],
          ),
        },
        onTap: (argument) {
          // markers = {
          // Marker(
          //   markerId: const MarkerId("1"),
          //   position: argument,
          // ),
          // };
          markers.add(Marker(
            markerId: MarkerId("${markers.length + 1}"),
            position: argument,
          ));
          setState(() {});
        },
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: LatLng(31.15564, 30.122236),
          zoom: 15,
        ),
        trafficEnabled: true,
        zoomControlsEnabled: false,
        buildingsEnabled: false,
        liteModeEnabled: true,
        markers: markers,
      ),
    );
  }
}
