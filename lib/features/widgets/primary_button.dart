import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final bool isFullWidth;
  final IconData? icon;
  final Color? backgroundColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 58,
    this.isFullWidth = true,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null && !isLoading;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isFullWidth ? double.infinity : width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isEnabled
            ? (backgroundColor ?? AppColors.secondary)
            : Colors.grey.shade300,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled
              ? () {
                  HapticFeedback.lightImpact();
                  onPressed?.call();
                }
              : null,
          borderRadius: BorderRadius.circular(18),
          splashColor: Colors.white.withOpacity(0.2),
          highlightColor: Colors.white.withOpacity(0.1),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, color: Colors.white, size: 22),
                        const SizedBox(width: 12),
                      ],
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
