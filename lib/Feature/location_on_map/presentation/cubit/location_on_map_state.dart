part of 'location_on_map_cubit.dart';

sealed class LocationOnMapState extends Equatable {
  const LocationOnMapState();

  @override
  List<Object> get props => [];
}

final class LocationOnMapInitial extends LocationOnMapState {}

final class ChangeLocationMarkerOnMap extends LocationOnMapState {}

final class ChangeLocationMarkerFailureOnMap extends LocationOnMapState {
  const ChangeLocationMarkerFailureOnMap();
}

final class ChangeLocationToNewLocation extends LocationOnMapState {}

final class ChangeCurrentLocationToStringSuccessState
    extends LocationOnMapState {
  const ChangeCurrentLocationToStringSuccessState();
  @override
  List<Object> get props => [];
}

final class ChangeCurrentLocationToStringFailureState
    extends LocationOnMapState {}

final class GetCurrentPositionState extends LocationOnMapState {
  final LatLng currentLocation;
  @override
  List<Object> get props => [currentLocation];
  const GetCurrentPositionState(this.currentLocation);
}
