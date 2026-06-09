import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/primary_button.dart';

class ReportDetectedScreen extends StatefulWidget {
  const ReportDetectedScreen({super.key});

  @override
  State<ReportDetectedScreen> createState() => _ReportDetectedScreenState();
}

class _ReportDetectedScreenState extends State<ReportDetectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Report Detected",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/icons/document.png",
                          height: 50,
                          width: 50,
                          color: AppColors.primary,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.description_rounded,
                            size: 50,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "CBC Report",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.calendar_today_rounded, size: 14, color: AppColors.textSecondary),
                          const SizedBox(width: 6),
                          Text(
                            "Oct 24, 2023 • 10:30 AM",
                            style: TextStyle(
                              color: AppColors.textSecondary.withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Divider(height: 1),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green.withOpacity(0.1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.check_circle_rounded, color: Colors.green, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  "Report Successfully Detected",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "We have identified this as a CBC (Complete Blood Count) report. Our AI analyze the values for you.",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      PrimaryButton(
                        text: "View Results",
                        onPressed: () {
                          // Action here
                        },
                        backgroundColor: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Sticky Bottom Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline_rounded, color: AppColors.textPrimary.withOpacity(0.6), size: 24),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Always consult a doctor for medical diagnosis and treatment.",
                            style: TextStyle(
                              color: AppColors.textPrimary.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
