import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  static const LatLng pGoogelPlrx = LatLng(37.4233, -122.0848);
  static const LatLng pApplePark = LatLng(37.3346, -122.0090);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: CameraPosition(target: pGoogelPlrx, zoom: 13),
          markers: {
            Marker(
                markerId: MarkerId("_currentlocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: pGoogelPlrx),
            Marker(
                markerId: MarkerId("_sourcelocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: pApplePark)
          }),
    );
  }
}
