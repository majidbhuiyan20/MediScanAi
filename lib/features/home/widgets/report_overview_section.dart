import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class ReportOverviewSection extends StatelessWidget {
  const ReportOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildStatusIndicator(
              color: Colors.green,
              label: 'Normal',
            ),
            const SizedBox(width: 16),
            _buildStatusIndicator(
              color: Colors.orange,
              label: 'High',
            ),
            const SizedBox(width: 16),
            _buildStatusIndicator(
              color: Colors.red,
              label: 'Low',
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Content placeholder to ensure it's visible
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text("Overview content placeholder"),
        ),
      ],
    );
  }

  Widget _buildStatusIndicator({required Color color, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
