import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final PageController bannerController = PageController();
  final List<String> bannerImages = [
    "https://i.pinimg.com/564x/b3/74/21/b374218190f8c91d0dac55ad643d046c.jpg",
    "https://i.pinimg.com/236x/18/a4/9f/18a49f35bab36eac45d8f5f7a931294d.jpg",
    "https://i.pinimg.com/564x/b3/74/21/b374218190f8c91d0dac55ad643d046c.jpg",
    "https://i.pinimg.com/236x/18/a4/9f/18a49f35bab36eac45d8f5f7a931294d.jpg",
  ];
  final List categoryList = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  HomeBloc() : super(const HomeState()) {
    on<LocationSelecting>((event, emit) {
      emit(state.copyWith(selectedValue: event.selectedValue));
    });
  }
}

