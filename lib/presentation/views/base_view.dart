import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.green,
          child: const TabBar(tabs: [
            Tab(
              text: 'Home',
            ),
            Tab(
              text: 'Home',
            ),
            Tab(
              text: 'Home',
            ),
          ]),
        ),
      ),
    );
  }
}
