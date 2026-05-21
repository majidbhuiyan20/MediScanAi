import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text("Report Screen", style: TextStyle(color: AppColors.textPrimary))),
    );
  }

}
