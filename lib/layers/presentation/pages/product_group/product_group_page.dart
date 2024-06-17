import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paloma365_task/layers/domain/entity/product_group.dart';
import 'package:paloma365_task/layers/domain/usecase/add_product_group.dart';
import 'package:paloma365_task/layers/domain/usecase/get_product_groups.dart';
import 'package:paloma365_task/layers/presentation/pages/product_group/cubit/add_product_group_cubit.dart';
import 'package:paloma365_task/layers/presentation/pages/product_group/cubit/product_group_cubit.dart';
import 'package:paloma365_task/layers/presentation/pages/products/products_page.dart';
import 'package:paloma365_task/layers/presentation/widgets/loading_widget.dart';
import 'package:paloma365_task/layers/presentation/widgets/standart_padding.dart';

//------------------------------------------------------------------------------
// PAGE
//------------------------------------------------------------------------------

class ProductGroupsPage extends StatefulWidget {
  const ProductGroupsPage({super.key});

  @override
  State<ProductGroupsPage> createState() => _ProductGroupPageState();
}

class _ProductGroupPageState extends State<ProductGroupsPage> {
  late final TextEditingController _groupNameController;

  @override
  void initState() {
    _groupNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProductGroupCubit(
                  getProductGroups: context.read<GetProductGroups>())
                ..getProductGroups()),
          BlocProvider(
              create: (context) => AddProductGroupCubit(
                  addProductGroup: context.read<AddProductGroup>()))
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Groups'),
          ),
          body: const _View(),
        ));
  }
}

//------------------------------------------------------------------------------
// VIEW
//------------------------------------------------------------------------------

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final state = context.select((ProductGroupCubit c) => c.state);
    final status = state.status;

    return BlocBuilder<ProductGroupCubit, ProductGroupPageState>(
      builder: (context, state) {
        if (status == ProductGroupPageStatus.initial ||
            status == ProductGroupPageStatus.loading) {
          return const Center(child: LoadingWidget());
        } else if (status == ProductGroupPageStatus.failure) {
          return const Center(child: LoadingWidget());
        } else {
          final groups = state.groups;
          if (groups.isEmpty) {
            return const Center(child: Text('No groups available'));
          }
          return ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final item = groups[index];
              return StandartPadding(
                child: Card(
                  child: ListTile(
                    onTap: () => _navigateToProductsPage(context, item),
                    title: Text(item.name.toString()),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  void _navigateToProductsPage(BuildContext context, ProductGroup item) =>
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductsPage(item: item)));
}
