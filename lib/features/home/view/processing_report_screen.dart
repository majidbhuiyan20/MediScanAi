import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/ai_orbit_loader.dart';
import '../widgets/processing_step_widget.dart';

class ProcessingReportScreen extends StatefulWidget {
  const ProcessingReportScreen({super.key});

  @override
  State<ProcessingReportScreen> createState() => _ProcessingReportScreenState();
}

class _ProcessingReportScreenState extends State<ProcessingReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Processing Report", style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600),),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(child: OrbitLoader()),
          SizedBox(height: 16,),
          ProcessingStepCard(title: 'Extracting text from report', iconPath: 'assets/icons/tick.png',),
          ProcessingStepCard(title: 'Detecting Report Type', iconPath: 'assets/icons/tick.png',),
          ProcessingStepCard(title: 'Analyzing Report', iconPath: 'assets/icons/tick.png',),
          ProcessingStepCard(title: 'Generating Explaination', iconPath: 'assets/icons/tick.png',),
          Spacer(),
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.04),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.timer_sharp, color: AppColors.textPrimary.withOpacity(0.7), size: 28),
                    SizedBox(width: 14),
                    Expanded(child: Text("This may take a few seconds....\n Please don't close the app", style: TextStyle(color: AppColors.textPrimary.withOpacity(0.7), fontWeight: FontWeight.w500, fontSize: 16),))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12,),
        ],
      ),
    );
  }
}


