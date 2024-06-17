import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/repository/repository.dart';

class GetProductGroups {
  GetProductGroups({required Repository repository}) : _repository = repository;
  final Repository _repository;

  Future<List<ProductGroup>> call() async {

    final result = await _repository.getProductGroups();

    return result;
  }
}
