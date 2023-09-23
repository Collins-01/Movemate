import 'package:flutter/material.dart';
import 'package:movemate/utils/app_colors.dart';

class ShipmentHistoryView extends StatefulWidget {
  const ShipmentHistoryView({Key? key}) : super(key: key);

  @override
  State<ShipmentHistoryView> createState() => _ShipmentHistoryViewState();
}

class _ShipmentHistoryViewState extends State<ShipmentHistoryView> {
  final List<String> _tabTitles = [
    "All",
    "Completed",
    "In progress",
    "Pending"
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(""),
                      const Text("Shipment History"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          ...List.generate(
                            _tabTitles.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      _selectedIndex = index;
                                    }),
                                    child: Row(
                                      children: [
                                        Text(_tabTitles[index]),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                            left: 6,
                                            bottom: 3,
                                            right: 6,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: AppColors.primaryOrangeColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                          ),
                                          child: const Text("10"),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    height: 2,
                                    width: 50,
                                    color: _selectedIndex == index
                                        ? AppColors.primaryOrangeColor
                                        : AppColors.primaryColor,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  ...List.generate(
                    10,
                    (index) => const ShipmentHistoryItem(),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

class ShipmentHistoryItem extends StatelessWidget {
  const ShipmentHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 206, 197, 197),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 20,
        bottom: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            child: const Text(
              "Loading",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Arriving Today!"),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Excepteur est elit nisi sit voluptate incididunt est dolore cupidatat fugiat pariatur.",
          ),
        ],
      ),
    );
  }
}
