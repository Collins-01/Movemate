// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/calculate_view.dart';
import 'package:movemate/presentation/views/home_view.dart';
import 'package:movemate/presentation/views/shipment_history_view.dart';

import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class BottomNav extends StatefulWidget {
  final int activeIndex;
  const BottomNav({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _indicatorAnimation;
  late AnimationController _indicatorController;
  final _navItems = [
    NavItem(title: "Home", icon: Icons.home),
    NavItem(title: "Calculate", icon: Icons.calculate),
    NavItem(title: "Shipment", icon: Icons.alarm),
    NavItem(title: "Profile", icon: Icons.person_2_outlined),
  ];

  int _selectedIndex = 0;
  @override
  void initState() {
    _indicatorController =
        AnimationController(vsync: this, duration: AppConfig.animationDuration);
    _indicatorAnimation = Tween(
      begin: const Offset(0, 120),
      end: const Offset(70, 120),
    ).animate(_indicatorController);
    super.initState();
  }

// AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 curve: Curves.bounceIn,
//                 height: 2,
//                 width: MediaQuery.of(context).size.width / 5,
//                 color: AppColors.primaryColor,
//               ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeView(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 8),
          color: AppColors.primaryWhiteColor,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                _navItems.length,
                (index) => SizedBox(
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        _selectedIndex = index;
                      });
                      await Future.delayed(
                        const Duration(milliseconds: 300),
                        () {
                          if (_selectedIndex == 1) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const CalculateView(),
                              ),
                            );
                          }
                          if (_selectedIndex == 2) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const ShipmentHistoryView(),
                              ),
                            );
                          }
                        },
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _selectedIndex == index
                            ? AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceIn,
                                height: 2,
                                width: MediaQuery.of(context).size.width / 5,
                                color: AppColors.primaryColor,
                              )
                            : AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                // curve: Curves.bounceIn,
                                height: 2,
                                width: MediaQuery.of(context).size.width / 5,
                                color: Colors.transparent,
                              ),
                        const SizedBox(
                          height: 2,
                        ),
                        Icon(_navItems[index].icon),
                        AppText.medium(_navItems[index].title),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem {
  final String title;
  final IconData icon;
  NavItem({
    required this.title,
    required this.icon,
  });
}
