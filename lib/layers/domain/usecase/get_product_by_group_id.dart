import 'package:paloma365_task/layers/domain/entity/product.dart';
import 'package:paloma365_task/layers/domain/repository/repository.dart';

class GetProductsByGroupId {
  GetProductsByGroupId({required Repository repository})
      : _repository = repository;
  final Repository _repository;

  Future<List<Product>> call(int id) async {
    final result = await _repository.getProductByGroupId(id);

    return result;
  }
}
