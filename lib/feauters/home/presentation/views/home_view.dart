import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_Drawer.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/favourite_body.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/home_view_body.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/notfications_body.dart';
import 'package:rosemary/feauters/orders/presentation/views/orders_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final views = [
    const HomeViewBody(),
    const OrdersViewBody(),
    const FavouritesBody(),
    const NotficationsBody()
  ];
  final List<String> titles = ["Home", "Orders", "Favourite", "Notfications"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: kColor.withOpacity(.2),
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined, size: 30),
            label: titles[0],
            selectedIcon: const Icon(Icons.home, size: 30),
          ),
          NavigationDestination(
              icon: const Icon(FontAwesomeIcons.list), label: titles[1]),
          NavigationDestination(
            icon: const Icon(Icons.favorite_outline),
            label: titles[2],
            selectedIcon: const Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: const Icon(Icons.notifications_outlined),
            label: titles[3],
            selectedIcon: const Icon(Icons.notifications),
          )
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => setState(() => currentIndex = index),
      ),
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(title: titles[currentIndex]),
      body: views[currentIndex],
    );
  }
}
