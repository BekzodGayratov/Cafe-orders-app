import 'package:flutter/material.dart';
import 'package:paloma365_task/layers/presentation/pages/order/order_page.dart';
import 'package:paloma365_task/layers/presentation/pages/product_group/product_group_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined), label: 'Orders')
        ],
        onTap: (v) {
          setState(() {
            _currentIndex = v;
            _tabController.animateTo(_currentIndex);
          });
        },
      ),
    );
  }

  List<Widget> get _screens => [const ProductGroupsPage(), const OrderPage()];
}
