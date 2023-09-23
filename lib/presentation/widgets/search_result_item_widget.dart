import 'package:flutter/material.dart';

class SearchResultItemWidget extends StatelessWidget {
  const SearchResultItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Veniam cillum nisi esse "),
              Text(
                "Voluptate minim proident laborum irure est. ",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
