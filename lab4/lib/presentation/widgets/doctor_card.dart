import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/doctor.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 0.0,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: AppColors.primary.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: -3.0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
            child: Image.network(
              alignment: Alignment.topCenter,
              doctor.imagePath,
              fit: BoxFit.cover,
              height: 109,
              width: 109,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dr. ${doctor.name}',
                        style: AppTextStyles.heading2.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SvgPicture.asset(
                        AppAssets.heartIcon,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.divider,
                    thickness: 1,
                  ),
                  Text(
                    doctor.speciality,
                    style: AppTextStyles.subtitle1,
                  ),
                  const SizedBox(height: 4),
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
                        doctor.center,
                        style: AppTextStyles.body2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(
                        doctor.rating > 4.8
                            ? AppAssets.fullStarIcon
                            : AppAssets.halfStarIcon,
                        fit: BoxFit.fill,
                        width: 16.0,
                        height: 16.0,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        doctor.rating.toString(),
                        style: AppTextStyles.body2,
                      ),
                      SizedBox(
                        height: 13.0,
                        child: VerticalDivider(
                          color: AppColors.divider,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        '${doctor.reviewCount} Reviews',
                        style: AppTextStyles.body2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
