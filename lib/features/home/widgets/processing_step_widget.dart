import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
class ProcessingStepCard extends StatelessWidget {
  const ProcessingStepCard({
    super.key, required this.title, required this.iconPath,
  });
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

        ),
        child: Row(
          children: [
            Image.asset(iconPath, height: 24, width: 24, color: Colors.green,),
            SizedBox(width: 12,),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary),)
          ],
        ),
      ),
    );
  }
}