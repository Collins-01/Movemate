// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CalculateTextFieldWidget extends StatelessWidget {
  final Widget icon;
  final Color? bgColor;
  final Widget? suffixIcon;
  final String? hintText;
  const CalculateTextFieldWidget({
    Key? key,
    required this.icon,
    this.hintText,
    this.bgColor,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            right: 15,
            top: 14,
          ),
          suffixIcon: suffixIcon ?? const SizedBox.shrink(),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 12,
              ),
              icon,
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 25,
                width: 2,
                color: Colors.grey.shade300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
