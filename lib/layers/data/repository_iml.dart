import 'package:flutter/material.dart';
import 'package:paloma365_task/layers/data/source/local/db_helper.dart';
import 'package:paloma365_task/layers/domain/entity/order.dart';
import 'package:paloma365_task/layers/domain/entity/product.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/repository/repository.dart';

//------------------------------------------------------------------------------
// CREATE CONCREATE CLASS TO OPERATE DB FEATURES THAT EXTENDS FROM REPOSITORY ABSTRACT CLASS
//------------------------------------------------------------------------------

class RepositoryImpl implements Repository {
  final DatabaseHelper dbHelper;

  RepositoryImpl({required this.dbHelper});
  @override
  Future<List<ProductGroup>> getProductGroups() async {
    final result = await dbHelper.queryAllRows('product_groups');
    return result.map((map) => ProductGroup.fromMap(map)).toList();
  }

  @override
  Future<void> saveOrder(Order order) async {
    await dbHelper.insert('orders', order.toMap());
  }

  @override
  Future<List<Order>> getOrders() async {
    final result = await dbHelper.queryAllRows('orders');

    return result.map((map) => Order.fromMap(map)).toList();
  }

  @override
  Future<List<Product>> getProductByGroupId(int id) async {
    final result = await dbHelper.getProductsByGroupId(id);
    return result.map((map) => Product.fromMap(map)).toList();
  }

  @override
  Future<void> addProductGroup(ProductGroup productGroup) async {
    await dbHelper.insert('product_groups', productGroup.toMap());
  }

  @override
  Future<void> addProduct(Product product) async {
    await dbHelper.insert('products', product.toMap());
  }
  
  @override
  Future<void> deleteProduct(Product productGroup) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
}
