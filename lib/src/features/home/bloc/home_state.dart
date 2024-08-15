part of 'home_bloc.dart';
@immutable
class HomeState extends Equatable {
  final String selectedValue;

  const HomeState({this.selectedValue = ''});

  HomeState copyWith({
    String? selectedValue,
  }) {
    return HomeState(
      selectedValue: selectedValue ?? this.selectedValue,
    );
  }

  @override
  List<Object?> get props => [selectedValue];
}


