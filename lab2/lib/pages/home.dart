import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab2/models/category.dart';
import 'package:lab2/models/doctor.dart';
import 'package:lab2/models/main_card.dart';
import 'package:lab2/models/medical_center.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getCategories();
    final medicalCenters = MedicalCenterModel.getMedicalCenters();
    final doctors = DoctorModel.getDoctors();
    final mainCards = MainCardModel.getMainCards();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              LocationWidget(),
              SearchDoctor(),
              MainCardsCarousel(mainCards: mainCards),
              Categories(categories: categories),
              MedicalCentersWidget(medicalCenters: medicalCenters),
              DoctorsWidget(doctors: doctors)
            ],
          ),
        ));
  }
}

class MainCardsCarousel extends StatefulWidget {
  const MainCardsCarousel({
    super.key,
    required this.mainCards,
  });

  final List<MainCardModel> mainCards;

  @override
  State<MainCardsCarousel> createState() => _MainCardsCarouselState();
}

class _MainCardsCarouselState extends State<MainCardsCarousel> {
  int selectedMainCard = 0; // State for the selected card

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 170,
      width: double.infinity,
      child: Stack(
        children: [
          CarouselSlider(
            items: widget.mainCards.map((card) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: MainCard(card: card),
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
              children: List.generate(widget.mainCards.length, (i) {
                bool isActive = selectedMainCard == i;

                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white : Color(0xffe5efeb),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(right: 5),
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

class DoctorsWidget extends StatelessWidget {
  const DoctorsWidget({
    super.key,
    required this.doctors,
  });

  final List<DoctorModel> doctors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('532 founds',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1c2a3a))),
            Row(
              children: [
                Text(
                  'Default',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6b7280)),
                ),
                SizedBox(width: 5),
                SvgPicture.asset(
                  'assets/icons/opposite-arrows.svg',
                  fit: BoxFit.scaleDown,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 8),
        Column(
          children: List.generate(doctors.length, (index) {
            return Column(
              children: [
                DoctorCard(doctor: doctors[index]),
                SizedBox(height: 10), // Space between each DoctorCard
              ],
            );
          }),
        ),
      ]),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctor,
  });

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 0.0,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: -3.0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(15), // Apply border radius to image
            child: Image.asset(
              alignment: Alignment.topCenter,
              doctor.imagePath,
              fit: BoxFit.cover,
              height: 109,
              width: 109,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Dr. ${doctor.name}',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff1f2a37))),
                    SvgPicture.asset(
                      'assets/icons/heart.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xffe5e7eb),
                  thickness: 1,
                ),
                Text(doctor.speciality,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4b5563))),
                SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location-empty.svg',
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        Color(0xff6b7280),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(doctor.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6b7280))),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      doctor.rating > 4.8
                          ? 'assets/icons/full-star.svg'
                          : 'assets/icons/half-star.svg',
                      fit: BoxFit.fill,
                      width: 16.0,
                      height: 16.0,
                    ),
                    SizedBox(width: 3),
                    Text(doctor.rating.toString(),
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6b7280))),
                    SizedBox(
                      height: 13.0,
                      child: VerticalDivider(
                        color: Color(0xffe5e7eb),
                        thickness: 1,
                      ),
                    ),
                    Text('${doctor.reviewCount} Reviews',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6b7280))),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class MedicalCentersWidget extends StatelessWidget {
  const MedicalCentersWidget({
    super.key,
    required this.medicalCenters,
  });

  final List<MedicalCenterModel> medicalCenters;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nearby Medical Centers',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff1c2a3a),
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6b7280),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView.separated(
              itemCount: medicalCenters.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              },
              itemBuilder: (context, index) {
                return MedicalCenterCardWidget(
                    medicalCenter: medicalCenters[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MedicalCenterCardWidget extends StatelessWidget {
  const MedicalCenterCardWidget({
    super.key,
    required this.medicalCenter,
  });

  final MedicalCenterModel medicalCenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.09),
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(1, 1),
          ),
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.05),
            blurRadius: 2,
            spreadRadius: 0,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                medicalCenter.imagePath,
                fit: BoxFit.cover,
                height: 120,
                width: 232,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xff1f2a37).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/heart.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 222,
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicalCenter.name,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4b5563),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location.svg',
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        Color(0xff6b7280),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      medicalCenter.address,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff6b7280),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(medicalCenter.rating.toString(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff6b7280),
                        )),
                    SizedBox(width: 5),
                    ...List.generate(5, (index) {
                      if (index < medicalCenter.rating.floor()) {
                        return SvgPicture.asset(
                          './assets/icons/full-star.svg',
                          fit: BoxFit.scaleDown,
                        );
                      } else if (index == medicalCenter.rating.floor() &&
                          medicalCenter.rating % 1 >= 0.5) {
                        return SvgPicture.asset(
                          './assets/icons/half-star.svg',
                          fit: BoxFit.fill,
                          height: 10,
                          width: 10,
                        );
                      } else {
                        return SvgPicture.asset(
                          './assets/icons/empty-star.svg',
                          fit: BoxFit.scaleDown,
                        );
                      }
                    }),
                    SizedBox(width: 5),
                    Text('(${medicalCenter.reviewCount} Reviews)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6b7280),
                        )),
                  ],
                ),
                Divider(
                  color: Color(0xffe5e7eb),
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/routing.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${medicalCenter.distance} km/ ${medicalCenter.distanceTime} min',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6b7280),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/hospital.svg',
                          fit: BoxFit.scaleDown,
                        ),
                        Text('Hospital',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6b7280),
                            )),
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

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 14.0, top: 40, left: 16, right: 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6b7280),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Seattle, USA',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff374151),
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(
                    'assets/icons/arrow-down.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xfff3f4f6),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(children: [
              SvgPicture.asset(
                'assets/icons/notification.svg',
                fit: BoxFit.scaleDown,
              ),
              Positioned(
                  top: 3,
                  left: 15,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ))
            ]),
          ),
        ]));
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.card,
  });

  final MainCardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
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
                color: Colors.white.withOpacity(0.2),
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
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24.0),
            child: SizedBox(
              width: 172,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(card.subtitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffffffff),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Categories',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1c2a3a))),
                Text(
                  'See All',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6b7280)),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < categories.length / 2; i++)
                  CategoryCard(category: categories[i])
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 4; i < categories.length; i++)
                  CategoryCard(category: categories[i])
              ],
            )
          ],
        ));
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

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
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SvgPicture.asset(
                category.iconPath,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          width: 62,
          child: Text(
            textAlign: TextAlign.center,
            category.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff4b5563),
            ),
          ),
        )
      ],
    );
  }
}

class SearchDoctor extends StatelessWidget {
  const SearchDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, left: 16.0, right: 16.0),
      height: 40.0,
      child: TextField(
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF3F4F6),
          prefixIconColor: Color(0xff9CA3AF),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0), // Adjust right padding as needed
            child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hintText: 'Search doctor...',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Color(0xff9CA3AF),
          ),
        ),
      ),
    );
  }
}
