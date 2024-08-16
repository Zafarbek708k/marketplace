part of 'home_bloc.dart';

abstract class HomeEvent {}

// class HomeInitial extends HomeEvent{}
class LocationSelecting extends HomeEvent{
  final String selectedValue;
  LocationSelecting(this.selectedValue);
}


class GetProductList extends HomeEvent{final List <ProductModel> list; GetProductList({required this.list});}

class PostProduct extends HomeEvent{final ProductModel productModel; PostProduct({required this.productModel});}

class ReadBasket extends HomeEvent{List<ProductPostModel> list;ReadBasket({required this.list});}