import 'package:paloma365_task/layers/domain/entity/order.dart';
import 'package:paloma365_task/layers/domain/entity/product.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';

abstract class Repository {
  Future<List<ProductGroup>> getProductGroups();

  Future<List<Product>> getProductByGroupId(int id);

  Future<void> saveOrder(Order order);

  Future<void> addProductGroup(ProductGroup productGroup);

  Future<void> addProduct(Product productGroup);

  
    Future<void> deleteProduct(Product productGroup);
  
  Future<List<Order>> getOrders();
}
