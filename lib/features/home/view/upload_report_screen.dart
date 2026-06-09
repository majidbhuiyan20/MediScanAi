import 'package:flutter/material.dart';
import 'package:mediscanai/core/constants/app_colors.dart';
import 'package:mediscanai/features/widgets/dotted_border_painter.dart';

import '../../widgets/bullet_point.dart';
import 'processing_report_screen.dart';

class UploadReportScreen extends StatefulWidget {
  const UploadReportScreen({super.key});

  @override
  State<UploadReportScreen> createState() => _UploadReportScreenState();
}

class _UploadReportScreenState extends State<UploadReportScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToProcessing();
  }

  void _navigateToProcessing() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProcessingReportScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Upload Report", style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600),),
      ),
      body: SafeArea(child: Column(
        children: [
          SizedBox(height: 40,),
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.textPrimary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  "assets/icons/upload_file.png",
                  height: 150,
                  width: 150,
                )),
            ),
          ),
          SizedBox(height: 20,),
          Text.rich(
            TextSpan(
              text: "Uploading ",
              style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: 20),
              children: [

                TextSpan(text: "Report...", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 20)),

              ],
            ),
          ),
          SizedBox(height: 4,),
          Text("Please wait while we process your file", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[700]),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 10,
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("70%", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                      Text("700 KB / 1 MB", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CustomPaint(
              painter: DottedBorderPainter(
                color: AppColors.primary.withOpacity(0.5),
                strokeWidth: 2,
                gap: 4,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(20),

                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.primary, size: 20),
                        SizedBox(width: 8),
                        Text(
                          "Tips for better result",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    BulletPoint(text: "Upload clear and readable reports"),
                    BulletPoint(text: "Supported formats: JPG, PNG, PDF"),
                    BulletPoint(text: "Ensure good lighting for photos"),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.all(40.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.04),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.lock_outline, color: AppColors.textPrimary.withOpacity(0.7), size: 28),
                  SizedBox(width: 14),
                  Expanded(child: Text("Your report is secure and never sheared with anyone", style: TextStyle(color: AppColors.textPrimary.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 16),))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}


