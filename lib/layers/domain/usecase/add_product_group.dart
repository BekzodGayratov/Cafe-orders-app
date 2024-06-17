import 'package:paloma365_task/layers/domain/entity/order.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/repository/repository.dart';

class AddProductGroup {
  AddProductGroup({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<void> call(ProductGroup productGroup) async {
    final result = await _repository.addProductGroup(productGroup);

    return result;
  }
}
