class MainCardModel {
  String title;
  String subtitle;
  String imagePath;

  MainCardModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  static List<MainCardModel> getMainCards() {
    List<MainCardModel> mainCards = [];

    mainCards.add(MainCardModel(
      title: 'Looking for Specialist Doctors?',
      subtitle: 'Schedule an appointment with our top doctors.',
      imagePath: './assets/images/doctor.png',
    ));

    mainCards.add(MainCardModel(
      title: 'Need Dental Care?',
      subtitle: 'Book a consultation with our experienced dentists.',
      imagePath: './assets/images/doctor2.png',
    ));

    mainCards.add(MainCardModel(
      title: 'Eye Care Specialists Available!',
      subtitle: 'Get expert advice and treatments for your eyes.',
      imagePath: './assets/images/doctor3.png',
    ));

    mainCards.add(MainCardModel(
      title: 'Consult Nutrition Experts',
      subtitle: 'Get personalized diet plans from certified nutritionists.',
      imagePath: './assets/images/doctor4.png',
    ));

    return mainCards;
  }
}
