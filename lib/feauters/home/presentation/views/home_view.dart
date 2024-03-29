import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/widgets/MyDrawer.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/favourite_body.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/home_view_body.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/notfications_body.dart';
import 'package:rosemary/feauters/home/presentation/views/widgets/orders_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final views = [
    const HomeViewBody(),
    const OrdersBody(),
    const FavouritesBody(),
    const NotficationsBody()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: kColor.withOpacity(.2),
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: 30),
            label: "Home",
            selectedIcon: Icon(Icons.home, size: 30),
          ),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.list), label: "Orders"),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: "Favourite",
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            label: "Notifications",
            selectedIcon: Icon(Icons.notifications),
          )
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (index) => setState(() => currentIndex = index),
      ),
      // drawer: const CustomDrawer(),
      appBar: CustomAppBar(currentIndex: currentIndex),
      body: views[currentIndex],
    );
  }
}
