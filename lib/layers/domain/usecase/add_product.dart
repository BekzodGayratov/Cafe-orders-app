import 'package:paloma365_task/layers/domain/entity/order.dart';
import 'package:paloma365_task/layers/domain/entity/product.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/repository/repository.dart';

class AddProduct {
  AddProduct({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<void> call(Product product) async {
    final result = await _repository.addProduct(product);

    return result;
  }
}
