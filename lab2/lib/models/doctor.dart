class DoctorModel {
  String name;
  String imagePath;
  String speciality;
  String center;
  num rating;
  num reviewCount;

  DoctorModel(
      {required this.name,
      required this.imagePath,
      required this.speciality,
      required this.center,
      required this.rating,
      required this.reviewCount});

  static List<DoctorModel> getDoctors() {
    List<DoctorModel> doctors = [];

    doctors.add(DoctorModel(
        name: 'David Patel',
        imagePath: './assets/images/david_patel.png',
        center: 'Cardiology Center, USA',
        speciality: 'Cardiologist',
        rating: 5.0,
        reviewCount: 1872));

    doctors.add(DoctorModel(
        name: 'Jessica Turner',
        imagePath: './assets/images/jessica_turner.png',
        center: "Women's Clinic,Seatle,USA",
        speciality: 'Gynecologist',
        rating: 4.9,
        reviewCount: 127));

    doctors.add(DoctorModel(
        name: 'Michael Johnson',
        imagePath: './assets/images/michael_johnson.png',
        center: "Maple Associates, NY,USA",
        speciality: 'Orthopedic Surgery',
        rating: 4.7,
        reviewCount: 5223));

    doctors.add(DoctorModel(
        name: 'Emily Walker',
        imagePath: './assets/images/emily_walker.png',
        center: 'Serenity Pediatrics Clinic',
        speciality: 'Pediatrics',
        rating: 5.0,
        reviewCount: 405));

    doctors.add(DoctorModel(
        name: 'Anna Kareninca',
        imagePath: './assets/images/anna_kareninca.png',
        center: 'Cardiology Center, USA',
        speciality: 'Cardiologist',
        rating: 4.5,
        reviewCount: 187));

    return doctors;
  }
}
