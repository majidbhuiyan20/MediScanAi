import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/primary_button.dart';
import '../../widgets/dotted_border_painter.dart';
class UploadReportWidget extends StatelessWidget {
  const UploadReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(
        color: AppColors.primary.withOpacity(0.5),
        strokeWidth: 2,
        gap: 4,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/icons/upload.png",
              height: 80,
              width: 80,
              color: AppColors.primary,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.cloud_upload_outlined,
                size: 60,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Upload Report",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "PDF, JPG, PNG (Max 10MB)",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              text: "Choose File",
              onPressed: () {},
              width: 150,
              isFullWidth: false,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}