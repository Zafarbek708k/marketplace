part of 'card_bloc.dart';
enum CardPageState { init, loading, success, error}

@immutable
class CardState extends Equatable {
  final List<ProductPostModel> basketList;
  final CardPageState cardPageState;

  const CardState({
    this.basketList = const [],
    this.cardPageState = CardPageState.init,
  });

  CardState copyWith({
    List<ProductPostModel>? basketList,
    CardPageState? cardPageState,
  }) {
    return CardState(
      basketList: basketList ?? this.basketList,
      cardPageState: cardPageState ?? this.cardPageState,
    );
  }

  @override
  List<Object> get props => [basketList, cardPageState];
}


