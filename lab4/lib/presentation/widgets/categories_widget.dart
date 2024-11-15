import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/category.dart';
import 'category_card.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Category> categories;

  const CategoriesWidget({
    super.key,
    required this.categories,
  });

  List<List<Category>> _chunkCategories(int chunkSize) {
    List<List<Category>> chunks = [];
    for (var i = 0; i < categories.length; i += chunkSize) {
      int end = (i + chunkSize < categories.length)
          ? i + chunkSize
          : categories.length;
      chunks.add(categories.sublist(i, end));
    }
    return chunks;
  }

  @override
  Widget build(BuildContext context) {
    final rows = _chunkCategories(4);

    return Container(
      margin: EdgeInsets.only(
        bottom: 20.0,
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.categories,
                style: AppTextStyles.heading2,
              ),
              Text(
                AppStrings.seeAll,
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          for (var row in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var category in row)
                    Expanded(child: CategoryCard(category: category)),
                  if (row.length < 4)
                    for (var i = 0; i < 4 - row.length; i++)
                      const Expanded(child: SizedBox.shrink()),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
