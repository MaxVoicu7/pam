import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 62,
          width: 62,
          decoration: BoxDecoration(
            color: category.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -31,
                left: -31,
                child: Container(
                  height: 62,
                  width: 62,
                  decoration: BoxDecoration(
                    color: AppColors.background.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SvgPicture.network(
                category.iconPath,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 62,
          child: Text(
            textAlign: TextAlign.center,
            category.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body2.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
