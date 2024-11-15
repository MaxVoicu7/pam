import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/medical_center.dart';
import 'medical_center_card.dart';

class MedicalCentersWidget extends StatelessWidget {
  final List<MedicalCenter> medicalCenters;

  const MedicalCentersWidget({
    super.key,
    required this.medicalCenters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.nearbyMedicalCenters,
                  style: AppTextStyles.heading2,
                ),
                Text(
                  AppStrings.seeAll,
                  style: AppTextStyles.body1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView.separated(
              itemCount: medicalCenters.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
              ),
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemBuilder: (context, index) {
                return MedicalCenterCardWidget(
                  medicalCenter: medicalCenters[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
