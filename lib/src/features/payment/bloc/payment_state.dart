part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();
}

final class PaymentInitial extends PaymentState {
  @override
  List<Object> get props => [];
}
