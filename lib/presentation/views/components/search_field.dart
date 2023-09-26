import 'package:flutter/material.dart';
import 'package:movemate/utils/utils.dart';

typedef StringCallback = Function(String);

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onTap,
    this.onChanged,
    this.isEnabled = false,
    this.hintText,
  });

  final VoidCallback? onTap;
  final String? hintText;
  final StringCallback? onChanged;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search-bar',
      child: SizedBox(
        height: 51,
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          child: Center(
            child: TextFormField(
              enabled: isEnabled,
              onChanged: onChanged,
              style: const TextStyle(
                color: AppColors.textColor,
              ),
              onTap: onTap,
              decoration: InputDecoration(
                hintText: hintText,
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 40,
                  maxWidth: 40,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    // height: 26,
                    // width: 26,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryOrangeColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.qr_code_scanner_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                contentPadding: const EdgeInsets.only(left: 20, top: 13),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
