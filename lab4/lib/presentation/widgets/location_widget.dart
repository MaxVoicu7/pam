import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_constants.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 14.0,
        top: 40,
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.location,
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.locationIcon,
                    fit: BoxFit.scaleDown,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Seattle, USA',
                    style: AppTextStyles.subtitle1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    AppAssets.arrowDownIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppAssets.notificationIcon,
                  fit: BoxFit.scaleDown,
                ),
                Positioned(
                  top: 3,
                  left: 15,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.error,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
