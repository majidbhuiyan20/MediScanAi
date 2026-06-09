import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
         title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text(
            "See All",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}