import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:paloma365_task/layers/domain/usecase/get_orders.dart';
import 'package:paloma365_task/layers/presentation/pages/order/cubit/order_page_cubit.dart';
import 'package:paloma365_task/layers/presentation/widgets/loading_widget.dart';
import 'package:paloma365_task/layers/presentation/widgets/standart_padding.dart';

//------------------------------------------------------------------------------
// PAGE
//------------------------------------------------------------------------------

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderPageCubit(getOrders: context.read<GetOrders>())..getOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
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
    final state = context.select((OrderPageCubit c) => c.state);
    final status = state.status;

    return BlocBuilder<OrderPageCubit, OrderPageState>(
      builder: (context, state) {
        if (status == OrderPageStatus.initial ||
            status == OrderPageStatus.loading) {
          return const Center(child: LoadingWidget());
        } else if (status == OrderPageStatus.failure) {
          return const Center(child: LoadingWidget());
        } else {
          final orders = state.orders;
          if (orders.isEmpty) {
            return const Center(child: Text('No orders available'));
          }
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final item = orders[index];
              return StandartPadding(
                child: Card(
                  child: ListTile(
                    title: Text(item.productId.toString()),
                    trailing: Text(DateFormat(DateFormat.HOUR24_MINUTE_SECOND)
                        .format(item.createdAt!)),
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
