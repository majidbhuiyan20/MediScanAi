import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../home/view/home_screen.dart';
import '../../history/history_screen.dart';
import '../../profile/profile_screen.dart';
import '../../report/report_screen.dart';
import '../view_model/bottom_nav_provider.dart';
import '../widgets/nav_widgets.dart';


class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    final List<Widget> screens = [
      const HomeScreen(),
      const HistoryScreen(),
      const ReportScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      body: PageTransitionSwitcher(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: PremiumBottomBar(
        currentIndex: currentIndex,
        onTap: (index) {
          HapticFeedback.lightImpact();
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}
