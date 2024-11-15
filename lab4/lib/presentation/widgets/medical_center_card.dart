import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/medical_center.dart';

class MedicalCenterCardWidget extends StatelessWidget {
  final MedicalCenter medicalCenter;

  const MedicalCenterCardWidget({
    super.key,
    required this.medicalCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
          BoxShadow(
            color: AppColors.primary.withOpacity(0.09),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(1, 1),
          ),
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  medicalCenter.imagePath,
                  fit: BoxFit.cover,
                  height: 120,
                  width: 232,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.heartIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 222,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicalCenter.name,
                  style: AppTextStyles.subtitle1,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.locationIcon,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        AppColors.textSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      medicalCenter.address,
                      style: AppTextStyles.body2,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      medicalCenter.rating.toString(),
                      style: AppTextStyles.body2.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    ...List.generate(5, (index) {
                      if (index < medicalCenter.rating.floor()) {
                        return SvgPicture.asset(
                          AppAssets.fullStarIcon,
                          fit: BoxFit.scaleDown,
                        );
                      } else if (index == medicalCenter.rating.floor() &&
                          medicalCenter.rating % 1 >= 0.5) {
                        return SvgPicture.asset(
                          AppAssets.halfStarIcon,
                          fit: BoxFit.fill,
                          height: 10,
                          width: 10,
                        );
                      } else {
                        return SvgPicture.asset(
                          AppAssets.emptyStarIcon,
                          fit: BoxFit.scaleDown,
                        );
                      }
                    }),
                    const SizedBox(width: 5),
                    Text(
                      '(${medicalCenter.reviewCount} Reviews)',
                      style: AppTextStyles.body2,
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.divider,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.routingIcon,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${medicalCenter.distance} km/ ${medicalCenter.distanceTime} min',
                          style: AppTextStyles.body2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.hospitalIcon,
                          fit: BoxFit.scaleDown,
                        ),
                        Text(
                          'Hospital',
                          style: AppTextStyles.body2,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
