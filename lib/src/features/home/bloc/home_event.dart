part of 'home_bloc.dart';

abstract class HomeEvent {}

// class HomeInitial extends HomeEvent{}
class LocationSelecting extends HomeEvent{
  final String selectedValue;

  LocationSelecting(this.selectedValue);
}
