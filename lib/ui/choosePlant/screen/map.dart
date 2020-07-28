import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  static LatLng flutterPlant = LatLng(31.502062, 34.640066);
  Set<Marker> myMarkers = {
    Marker(
      markerId: MarkerId('flutterPlant'),
      position: flutterPlant,
    ),
  };
  GoogleMapController controller;

  LatLng myLocation;

  Future<LatLng> getCurrentLocation() async {
    Geolocator geolocator = Geolocator();
    Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    myLocation = LatLng(position.latitude, position.longitude);
    return myLocation;
  }

  AnimateCamera(LatLng location) {
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
//            bearing: 30,
tilt:40 ,
            target: location,
            zoom: 13.2),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
      future: getCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GoogleMap(

            onMapCreated: (controller) async {
              this.controller = controller;
              await getCurrentLocation();
              AnimateCamera(
                  flutterPlant,
              );
            },
            onTap: (argument) {
              myMarkers.add(
                Marker(
                  markerId: MarkerId('argument'),
                  position: LatLng(argument.latitude, argument.longitude),
                ),
              );
              setState(() {});
            },
            markers: { ...?myMarkers ,
              Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              markerId: MarkerId('argument'),
              position: LatLng(myLocation.latitude, myLocation.longitude),
            ),
            },
            initialCameraPosition: CameraPosition(
              target: myLocation,
              zoom: 18.0,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
