// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          helperText: "Enter the receipt number ...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Container(
            // height: 28,
            // width: 28,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: const Icon(
              Icons.qr_code_scanner_rounded,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
              // left: 15,
              // top: 14,
              ),
        ),
      ),
    );
  }
}
