import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:marketplace/src/features/home/data/repository/home_repository.dart';

import '../data/entity/product_model.dart';
import '../data/entity/product_post_model.dart';
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


  HomeBloc() : super(const HomeState( homePageState: HomePageState.init, productList: [])) {
    on<LocationSelecting>((event, emit) {
      emit(state.copyWith(selectedValue: event.selectedValue));
    });


    on<GetProductList>(_getData);
     on<PostProduct>(_postData);
    on<ReadBasket>(_readBasket);
  }



  /// methods
   Future <void> _getData(GetProductList event, Emitter <HomeState> emit)async{
    emit(state.copyWith(homePageState: HomePageState.loading));
    List<ProductModel> result  =  await HomeRepository.getData();
    if(result.isNotEmpty){
      emit(state.copyWith(homePageState: HomePageState.success, productList: result));
    }else{
      emit(state.copyWith(homePageState: HomePageState.error, productList: []));
    }
  }


  Future<void> _postData(PostProduct event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homePageState: HomePageState.loading));
    try {
      await HomeRepository.postData(product: event.productModel);
      emit(state.copyWith(homePageState: HomePageState.success));
    } catch (e) {
      log('Error posting data: $e');
      emit(state.copyWith(homePageState: HomePageState.error));
    }
  }


  Future <void> _readBasket(ReadBasket event, Emitter <HomeState> emit)async{
    emit(state.copyWith(homePageState: HomePageState.loading));
    List<ProductModel> result  =  await HomeRepository.getData();
    if(result.isNotEmpty){
      emit(state.copyWith(homePageState: HomePageState.success, productList: result));
    }else{
      emit(state.copyWith(homePageState: HomePageState.error, productList: []));
    }
  }

}

