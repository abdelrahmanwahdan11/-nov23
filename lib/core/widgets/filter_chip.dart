import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({super.key, required this.label, this.selected = false, this.onTap});
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: selected ? AppColors.primary : Colors.grey.shade300),
        ),
        child: Text(label, style: TextStyle(color: selected ? AppColors.primary : AppColors.textSecondary)),
      ),
    );
  }
}
