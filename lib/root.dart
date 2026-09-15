import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';
import 'package:hungry_food_app/features/cart/view/cart_view.dart';
import 'package:hungry_food_app/features/home/view/home_view.dart';
import 'package:hungry_food_app/features/orderHistory/view/order_history_view.dart';
import 'package:hungry_food_app/features/profile/view/profile_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  //
  late PageController _pageController;
  late List<Widget> screens;
  int currentIndex = 0;

  @override
  void initState() {
    screens = const [HomeView(), CartView(), OrderHistoryView(), ProfileView()];
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: PageView(controller: _pageController, children: screens),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: AppColors.primary,
            selectedItemColor: AppColors.selected,
            selectedIconTheme: const IconThemeData(size: 36),
            unselectedIconTheme: const IconThemeData(size: 24),
            unselectedItemColor: AppColors.unselected,
            type: BottomNavigationBarType.fixed,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
                activeIcon: Icon(CupertinoIcons.cart_fill),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.clock),
                activeIcon: Icon(CupertinoIcons.clock_fill),
                label: 'Order History',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                activeIcon: Icon(CupertinoIcons.person_fill),
                label: 'Profile',
              ),
            ],
            onTap: (indexScreen) => setState(() {
              currentIndex = indexScreen;
              _pageController.jumpToPage(indexScreen);
            }),
          ),
        ),
      ),
    );
  }
}
