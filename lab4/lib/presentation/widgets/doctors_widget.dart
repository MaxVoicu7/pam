import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/doctor.dart';
import 'doctor_card.dart';

class DoctorsWidget extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorsWidget({
    super.key,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.defaultPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${doctors.length} ${AppStrings.found}',
                style: AppTextStyles.heading2,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.default_,
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
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
          const SizedBox(height: 8),
          Column(
            children: List.generate(
              doctors.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: DoctorCard(doctor: doctors[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
