import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text("History Screen", style: TextStyle(color: AppColors.textPrimary))),
    );
  }
}
