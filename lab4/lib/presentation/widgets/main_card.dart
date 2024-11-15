import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/main_card.dart';

class MainCardWidget extends StatelessWidget {
  final MainCard card;

  const MainCardWidget({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            card.imagePath,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            alignment: Alignment.topLeft,
            scale: 1.5,
          ),
          Positioned(
            top: -51,
            left: -51,
            child: Container(
              height: 162,
              width: 162,
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -141,
            left: 50,
            child: Container(
              height: 162,
              width: 162,
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 24.0),
            child: SizedBox(
              width: 172,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.title,
                    style: AppTextStyles.heading1.copyWith(
                      color: AppColors.background,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    card.subtitle,
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
