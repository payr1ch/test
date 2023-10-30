import 'package:flutter/material.dart';
import 'package:test_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  var leadingIcon;

  CustomTextField({
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
        prefixIcon: Icon(
          leadingIcon,
          size: 25,
          color: ThemeColors.iconColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: ThemeColors.iconColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: ThemeColors.iconColor),
        ),
      ),
    );
  }
}
