import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paloma365_task/layers/data/repository_iml.dart';
import 'package:paloma365_task/layers/data/source/local/db_helper.dart';
import 'package:paloma365_task/layers/domain/usecase/add_product_group.dart';
import 'package:paloma365_task/layers/domain/usecase/get_orders.dart';
import 'package:paloma365_task/layers/domain/usecase/get_product_by_group_id.dart';
import 'package:paloma365_task/layers/domain/usecase/get_product_groups.dart';
import 'package:paloma365_task/layers/domain/usecase/save_order.dart';
import 'package:paloma365_task/layers/presentation/pages/home_page.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  ///
  late final RepositoryImpl _repository;
  late final GetOrders _getOrders;
  late final GetProductGroups _getProductGroups;
  late final SaveOrder _saveOrder;
  late final GetProductsByGroupId _getProductsByGroupId;
  late final AddProductGroup _addProductGroup;

  void initialize() {
    final dbHelper = DatabaseHelper();
    _repository = RepositoryImpl(dbHelper: dbHelper);

    _getOrders = GetOrders(repository: _repository);
    _getProductGroups = GetProductGroups(repository: _repository);
    _saveOrder = SaveOrder(repository: _repository);
    _getProductsByGroupId = GetProductsByGroupId(repository: _repository);
    _addProductGroup = AddProductGroup(repository: _repository);
  }

  ///

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GetOrders>.value(value: _getOrders),
          RepositoryProvider<AddProductGroup>.value(value: _addProductGroup),
          RepositoryProvider<GetProductGroups>.value(value: _getProductGroups),
          RepositoryProvider<SaveOrder>.value(value: _saveOrder),
          RepositoryProvider<GetProductsByGroupId>.value(
              value: _getProductsByGroupId),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cafe orders',
          home: HomePage(),
        ));
  }
}
