part of 'order_page_cubit.dart';

enum OrderPageStatus { initial, loading, success, failure }

class OrderPageState extends Equatable {
  const OrderPageState(
      {this.status = OrderPageStatus.initial,
      this.orders = const [],
      this.failureMessage,
      this.loading = false});

  OrderPageState copyWith({
    OrderPageStatus? status,
    List<Order>? orders,
    String? failureMessage,
    bool? loading,
  }) {
    return OrderPageState(
        status: status ?? this.status,
        loading: loading ?? this.loading,
        failureMessage: failureMessage ?? this.failureMessage,
        orders: orders ?? this.orders);
  }

  final OrderPageStatus status;
  final List<Order> orders;
  final String? failureMessage;
  final bool loading;

  @override
  List<Object?> get props => [
        status,
        orders,
        failureMessage,
        loading,
      ];
}
