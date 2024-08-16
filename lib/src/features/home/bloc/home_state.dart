part of 'home_bloc.dart';

enum HomePageState { init, loading, success, error }

@immutable
class HomeState extends Equatable {
  final String selectedValue;
  final HomePageState homePageState;
  final List<ProductModel> productList;

  const HomeState({this.selectedValue = '', required this.homePageState, required this.productList});

  HomeState copyWith({
    String? selectedValue,
    HomePageState? homePageState,
    List<ProductModel>? productList,
  }) {
    return HomeState(
      selectedValue: selectedValue ?? this.selectedValue,
      homePageState: homePageState ?? this.homePageState,
      productList:  productList ?? this.productList,
    );
  }

  @override
  List<Object?> get props => [selectedValue, homePageState, productList];
}
