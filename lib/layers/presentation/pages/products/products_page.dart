import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/usecase/get_product_by_group_id.dart';
import 'package:paloma365_task/layers/presentation/pages/products/cubit/products_cubit.dart';
import 'package:paloma365_task/layers/presentation/widgets/loading_widget.dart';
import 'package:paloma365_task/layers/presentation/widgets/standart_padding.dart';

//------------------------------------------------------------------------------
// PAGE
//------------------------------------------------------------------------------

class ProductsPage extends StatefulWidget {
  final ProductGroup item;
  const ProductsPage({super.key, required this.item});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsPageCubit(
          getProductsByGroupId: context.read<GetProductsByGroupId>())
        ..getProductGroups(widget.item.id!),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.item.name.toString()),
        ),
        body: const _View(),
      ),
    );
  }
}

//------------------------------------------------------------------------------
// VIEW
//------------------------------------------------------------------------------

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final state = context.select((ProductsPageCubit c) => c.state);
    final status = state.status;

    return BlocBuilder<ProductsPageCubit, ProductsPageState>(
      builder: (context, state) {
        if (status == ProductsPageStatus.initial ||
            status == ProductsPageStatus.loading) {
          return const Center(child: LoadingWidget());
        } else if (status == ProductsPageStatus.failure) {
          return const Center(child: LoadingWidget());
        } else {
          final products = state.products;
          if (products.isEmpty) {
            return const Center(child: Text('No products available'));
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];
              return StandartPadding(
                child: Card(
                  child: ListTile(
                    title: Text(item.name.toString()),
                    subtitle: Text(item.id.toString()),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
