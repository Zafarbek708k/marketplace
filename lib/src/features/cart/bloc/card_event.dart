part of 'card_bloc.dart';

abstract class CardEvent extends Equatable {
  const CardEvent();
  @override
  List<Object?> get props => [];
}

class GetBasketProductList extends CardEvent {
  final List<ProductPostModel> list;
  const GetBasketProductList({required this.list});

  @override
  List<Object?> get props => [list];
}

class DeleteBasketItem extends CardEvent {
  final List<ProductPostModel> list;
  const DeleteBasketItem({required this.list});

  @override
  List<Object?> get props => [list];
}