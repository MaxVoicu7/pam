import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lab2/models/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryModel.getCategories();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
        child: Column(
          children: [
            SearchDoctor(),
            Container(
              height: 163,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/doctor.png',
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
                            'Looking for Specialist Doctors?',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffffffff),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Schedule an appointment with our top doctors',
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
            ),
            Categories(categories: categories)
          ],
        ),
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
        margin: EdgeInsets.only(top: 14.0, bottom: 14.0),
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
      margin: EdgeInsets.only(top: 14.0, bottom: 14.0),
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
