import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'location_on_map_state.dart';

class LocationOnMapCubit extends Cubit<LocationOnMapState> {
  LocationOnMapCubit() : super(LocationOnMapInitial());

  GoogleMapController? mapController;
  //locate.LocationData? currentLocation;
  //List<Marker> marker = [];
  GoogleMapController? _controller;
  LatLng? currentPosition;
  final List<Marker> _markers = [];
  String? locationString;

//! Location
  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    try {
      final position = await Geolocator.getCurrentPosition();

      currentPosition = LatLng(position.latitude, position.longitude);
      log(currentPosition.toString());
      emit(GetCurrentPositionState(currentPosition!));

      if (_controller != null) {
        _controller!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: currentPosition!,
              zoom: 14.0,
            ),
          ),
        );
      }

      _markers.add(
        Marker(
          markerId: const MarkerId('1'),
          position: currentPosition!,
        ),
      );
    } catch (e) {
      log('Error fetching location: $e');
    }
  }

  Future<void> updateLocationString(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;

        locationString =
            '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
        emit(const ChangeCurrentLocationToStringSuccessState());
      } else {
        locationString = 'Address not found.';
        emit(ChangeCurrentLocationToStringFailureState());
      }
    } catch (e) {
      locationString = 'Unable to get address.';
      emit(ChangeCurrentLocationToStringFailureState());
    }
  }
}

 




/*

//! Search Function
  void searchLocationData(String query, BuildContext context) async {
    final url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5';

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data;
        if (results.isNotEmpty) {
          List<Marker> newMarkers = [];
          for (var result in results) {
            final lat = double.parse(result['lat']);
            final lon = double.parse(result['lon']);
            final displayName = result['display_name'];
            final newLocation = LatLng(lat, lon);
            newMarkers.add(
              Marker(
                width: 80.0,
                height: 80.0,
                point: newLocation,
                child: Column(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40.0,
                    ),
                    Text(displayName, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            );
            mapController.move(newLocation, 15.0);
          }
          marker = newMarkers;
          currentLocation = locate.LocationData.fromMap({
            'latitude': currentLocation!.latitude,
            'longitude': currentLocation!.longitude,
          });
          emit(SrearchForLocationSuccessState());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Found ${results.length} locations.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location not found!')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error fetching location!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
 */
