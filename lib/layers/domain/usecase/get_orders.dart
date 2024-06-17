import 'package:paloma365_task/layers/domain/entity/order.dart';
import 'package:paloma365_task/layers/domain/repository/repository.dart';

class GetOrders {
  GetOrders({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<List<Order>> call() async {
    final result = await _repository.getOrders();

    return result;
  }
}
