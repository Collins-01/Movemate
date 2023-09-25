import 'package:flutter/material.dart';

enum ShipmentStatus {
  InProgress,
  Pending,
  Completed,
}

class ShipmentHistoryStatusItem extends StatelessWidget {
  final IconData icon;
  final String status;
  const ShipmentHistoryStatusItem({
    Key? key,
    required this.icon,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
      child: const Text(
        "Loading",
      ),
    );
  }
}
