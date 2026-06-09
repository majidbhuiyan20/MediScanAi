import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ReportExplanationSection extends StatelessWidget {
  const ReportExplanationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(1),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Explanation",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        // Custom content goes here
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text("Explanation content placeholder"),
        ),
      ],
    );
  }
}
