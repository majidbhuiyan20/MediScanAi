import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ReportRecommendationsSection extends StatelessWidget {
  const ReportRecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey(2),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recommendations",
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
          child: const Text("Recommendations content placeholder"),
        ),
      ],
    );
  }
}
