import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/text_style.dart';

class UserCard extends StatelessWidget {
  String userFullName;
  String address;

  UserCard({
    required this.userFullName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ThemeColors.containerDark),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  userFullName,
                  style: ThemeText.userNameStyle,
                )
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Text(
                  address,
                  style: ThemeText.textSecondary,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
