// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:movemate/presentation/views/calculate_view.dart';
import 'package:movemate/presentation/views/home_view.dart';
import 'package:movemate/presentation/views/shipment_history_view.dart';

import 'package:movemate/presentation/widgets/widgets.dart';
import 'package:movemate/utils/utils.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  final _navItems = [
    NavItem(title: "Home", icon: Icons.home),
    NavItem(title: "Calculate", icon: Icons.calculate),
    NavItem(title: "Shipment", icon: Icons.alarm),
    NavItem(title: "Profile", icon: Icons.person_2_outlined),
  ];

  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  // List of screens
  final List<Widget> _screens = [
    const HomeView(),
    // const CalculateView(),
    const SizedBox.shrink(),
    // const ShipmentHistoryView(),
    const SizedBox.shrink(),
    SafeArea(
      child: Scaffold(
        body: Center(
          child: AppText.heading1(
            "Profile View",
          ),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            color: AppColors.primaryWhiteColor,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        _navItems.length,
                        (index) => SizedBox(
                          child: GestureDetector(
                            onTap: () async {
                              if (_selectedIndex != index) {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              }
                              if (_selectedIndex == 1) {
                                await Future.delayed(
                                  const Duration(milliseconds: 80),
                                  () {
                                    Navigator.of(context)
                                        .push(
                                      MaterialPageRoute(
                                        builder: (_) => const CalculateView(),
                                      ),
                                    )
                                        .then((value) {
                                      setState(() {
                                        _selectedIndex = 0;
                                      });
                                    });
                                  },
                                );
                              }
                              if (_selectedIndex == 2) {
                                await Future.delayed(
                                  const Duration(milliseconds: 160),
                                  () {
                                    Navigator.of(context)
                                        .push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const ShipmentHistoryView(),
                                      ),
                                    )
                                        .then((value) {
                                      setState(() {
                                        _selectedIndex = 0;
                                      });
                                    });
                                  },
                                );
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  _navItems[index].icon,
                                  color: _selectedIndex != index
                                      ? Colors.grey[400]
                                      : AppColors.navColor,
                                ),
                                AppText.medium(
                                  _navItems[index].title,
                                  color: _selectedIndex != index
                                      ? Colors.grey[400]
                                      : AppColors.navColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  width: MediaQuery.of(context).size.width,
                  child: AnimatedAlign(
                    alignment: Alignment(
                        lerpDouble(-1.0, 1.0,
                            _selectedIndex / (_navItems.length - 1))!,
                        0),
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width / 5.1,
                      color: AppColors.navColor,
                    ),
                  ),
                ),
              ],
            ),
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
