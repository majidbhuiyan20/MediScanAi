import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mediscanai/features/widgets/primary_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/dotted_border_painter.dart';
import '../../widgets/header_title.dart';
import '../widgets/upload_report_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Banner
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.secondary,
                        AppColors.primary.withOpacity(0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "AI Medical Report Analyzer",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Upload any medical lab report and get easy explanation in seconds",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      CustomPaint(
                        painter: DottedBorderPainter(
                          color: Colors.white.withOpacity(0.5),
                          strokeWidth: 2,
                          gap: 4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/icons/scan_doc.png",
                            height: 80,
                            width: 80,
                            errorBuilder: (context, error, stackTrace) => const Icon(
                              Icons.document_scanner,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Upload Section
                UploadReportWidget(),
                const SizedBox(height: 20),

                // Recent Reports Header
                HeaderTitle(title: 'Recent Reports', onTap: () {  },),
                const SizedBox(height: 8),

                // Recent Report Item
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          "assets/icons/document.png",
                          height: 40,
                          width: 40,
                          color: Colors.red,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                            size: 32,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CBC Report",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "Oct 24, 2023 • 10:30 AM",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Normal",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(width: 6,),
                      Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary, fontWeight: FontWeight.w700,)
                    ],
                  ),
                ),
                // Extra bottom spacing to avoid overlapping with bottom navigation bar
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




