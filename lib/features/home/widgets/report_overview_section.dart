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
            _buildStatusIndicator(color: Colors.green, label: 'Normal'),
            const SizedBox(width: 16),
            _buildStatusIndicator(color: Colors.orange, label: 'High'),
            const SizedBox(width: 16),
            _buildStatusIndicator(color: Colors.red, label: 'Low'),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          "Test Results",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              _buildTestResultItem(
                title: "Hemoglobin",
                value: "10.2",
                unit: "g/dL",
                status: "Low",
                statusColor: Colors.red,
                normalRange: "12 - 16 g/dL",
                currentValue: 10.2,
                minNormal: 12,
                maxNormal: 16,
                minRange: 8,
                maxRange: 20,
              ),
              const Divider(height: 1, thickness: 0.1, color: Colors.grey, indent: 16, endIndent: 16),
              _buildTestResultItem(
                title: "WBC",
                value: "14.8",
                unit: "x10³/µL",
                status: "High",
                statusColor: Colors.orange,
                normalRange: "4.0 - 11.0 x10³/µL",
                currentValue: 14.8,
                minNormal: 4,
                maxNormal: 11,
                minRange: 0,
                maxRange: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTestResultItem({
    required String title,
    required String value,
    required String unit,
    required String status,
    required Color statusColor,
    required String normalRange,
    required double currentValue,
    required double minNormal,
    required double maxNormal,
    required double minRange,
    required double maxRange,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: statusColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: value,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          TextSpan(
                            text: " $unit",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Normal: $normalRange",
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: _buildRangeIndicator(
                  currentValue: currentValue,
                  minNormal: minNormal,
                  maxNormal: maxNormal,
                  minRange: minRange,
                  maxRange: maxRange,
                  indicatorColor: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRangeIndicator({
    required double currentValue,
    required double minNormal,
    required double maxNormal,
    required double minRange,
    required double maxRange,
    required Color indicatorColor,
  }) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double position = (currentValue - minRange) / (maxRange - minRange);
            position = position.clamp(0.0, 1.0);
            
            double minNormalPos = (minNormal - minRange) / (maxRange - minRange);
            double maxNormalPos = (maxNormal - minRange) / (maxRange - minRange);

            return Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  clipBehavior: Clip.none,
                  children: [
                    // Track
                    Container(
                      height: 4,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    // Ticks
                    Positioned(
                      left: width * minNormalPos,
                      top: 4,
                      child: Container(width: 1.2, height: 6, color: Colors.grey.withOpacity(0.4)),
                    ),
                    Positioned(
                      left: width * maxNormalPos,
                      top: 4,
                      child: Container(width: 1.2, height: 6, color: Colors.grey.withOpacity(0.4)),
                    ),
                    // Value Indicator (Pill shape)
                    Positioned(
                      left: width * position - 10,
                      top: -4,
                      child: Container(
                        width: 20,
                        height: 12,
                        decoration: BoxDecoration(
                          color: indicatorColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(width: width, height: 14),
                    Positioned(
                      left: width * minNormalPos - 6,
                      child: Text(minNormal.toInt().toString(), style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                      left: width * maxNormalPos - 6,
                      child: Text(maxNormal.toInt().toString(), style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w600)),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildStatusIndicator({required Color color, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
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
