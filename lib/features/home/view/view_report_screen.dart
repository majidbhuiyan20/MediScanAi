import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/primary_button.dart';
import '../widgets/report_tab_item.dart';
import '../widgets/report_overview_section.dart';
import '../widgets/report_explanation_section.dart';
import '../widgets/report_recommendations_section.dart';

final _selectedTabIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

class ViewReportScreen extends ConsumerWidget {
  const ViewReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTabIndex = ref.watch(_selectedTabIndexProvider);

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Report Analysis",
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Premium Tab Selection Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.appBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    ReportTabItem(
                      title: "Overview",
                      isSelected: selectedTabIndex == 0,
                      onTap: () =>
                          ref.read(_selectedTabIndexProvider.notifier).state = 0,
                    ),
                    ReportTabItem(
                      title: "Explanation",
                      isSelected: selectedTabIndex == 1,
                      onTap: () =>
                          ref.read(_selectedTabIndexProvider.notifier).state = 1,
                    ),
                    ReportTabItem(
                      title: "Advice",
                      isSelected: selectedTabIndex == 2,
                      onTap: () =>
                          ref.read(_selectedTabIndexProvider.notifier).state = 2,
                    ),
                  ],
                ),
              ),
            ),

            // Content Area with smooth transitions
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: SingleChildScrollView(
                  key: ValueKey<int>(selectedTabIndex),
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  child: _buildSelectedContent(selectedTabIndex),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: PrimaryButton(
          text: "Download PDF Report",
          icon: Icons.file_download_outlined,
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildSelectedContent(int selectedTabIndex) {
    switch (selectedTabIndex) {
      case 0:
        return const ReportOverviewSection();
      case 1:
        return const ReportExplanationSection();
      case 2:
        return const ReportRecommendationsSection();
      default:
        return const SizedBox.shrink();
    }
  }
}
