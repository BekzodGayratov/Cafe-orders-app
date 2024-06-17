import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:paloma365_task/layers/domain/entity/order.dart';
import 'package:paloma365_task/layers/domain/usecase/get_orders.dart';

part 'order_page_state.dart';

class OrderPageCubit extends Cubit<OrderPageState> {
  OrderPageCubit({required GetOrders getOrders})
      : _getOrders = getOrders,
        super(const OrderPageState());

  final GetOrders _getOrders;

  Future<void> getOrders() async {
    emit(state.copyWith(status: OrderPageStatus.loading));
    try {
      final orders = await _getOrders();

      emit(state.copyWith(orders: orders, status: OrderPageStatus.success));
    } catch (e) {
      emit(state.copyWith(
          failureMessage: e.toString(), status: OrderPageStatus.failure));
    }
  }
}
