import 'package:paloma365_task/layers/domain/entity/order.dart';
import 'package:paloma365_task/layers/domain/repository/repository.dart';

class SaveOrder {
  SaveOrder({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<void> call({required Order order}) async {
    final result = await _repository.saveOrder(order);
    return result;
  }
}
