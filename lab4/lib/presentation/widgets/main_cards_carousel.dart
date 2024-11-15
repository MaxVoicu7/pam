import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../controllers/main_card_controller.dart';
import 'main_card.dart';

class MainCardsCarousel extends StatefulWidget {
  const MainCardsCarousel({super.key});

  @override
  State<MainCardsCarousel> createState() => _MainCardsCarouselState();
}

class _MainCardsCarouselState extends State<MainCardsCarousel> {
  int selectedMainCard = 0;

  @override
  Widget build(BuildContext context) {
    final MainCardController controller = Get.find<MainCardController>();

    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.defaultPadding + 4),
      height: 170,
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
            items: controller.mainCards.map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding,
                    ),
                    child: MainCardWidget(card: card),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 163,
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  selectedMainCard = index;
                });
              },
            ),
          ),
          Positioned(
            right: 155,
            bottom: 10,
            child: Row(
              children: List.generate(controller.mainCards.length, (i) {
                bool isActive = selectedMainCard == i;
                return AnimatedContainer(
                  duration: Duration(
                    milliseconds: AppConstants.shortAnimationDuration,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.background
                        : AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.only(right: 5),
                  height: 6,
                  width: isActive ? 30 : 6,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
