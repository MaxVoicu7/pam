import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_constants.dart';

class SearchDoctor extends StatelessWidget {
  const SearchDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0,
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
      ),
      height: 40.0,
      child: TextField(
        style: AppTextStyles.body1.copyWith(
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.cardBackground,
          prefixIconColor: AppColors.textSecondary,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                AppAssets.searchIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 2.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
            borderSide: BorderSide.none,
          ),
          hintText: AppStrings.searchHint,
          hintStyle: AppTextStyles.body1.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
