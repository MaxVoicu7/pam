class MedicalCenterModel {
  String name;
  String imagePath;
  String address;
  num rating;
  num reviewCount;
  num distance;
  num distanceTime;

  MedicalCenterModel(
      {required this.name,
      required this.imagePath,
      required this.address,
      required this.rating,
      required this.reviewCount,
      required this.distance,
      required this.distanceTime});

  static List<MedicalCenterModel> getMedicalCenters() {
    List<MedicalCenterModel> medicalCenters = [];

    medicalCenters.add(MedicalCenterModel(
        name: 'Sunrise Health Clinic',
        imagePath: './assets/images/sunrise_hospital.png',
        address: '123 Oak Street, CA 98765',
        rating: 5.0,
        reviewCount: 58,
        distance: 2.5,
        distanceTime: 40));

    medicalCenters.add(MedicalCenterModel(
        name: 'Golden Cardiology Center',
        imagePath: './assets/images/golden_hospital.png',
        address: '555 Bridge Street, Golden Gate',
        rating: 4.9,
        reviewCount: 108,
        distance: 2.5,
        distanceTime: 40));

    medicalCenters.add(MedicalCenterModel(
        name: 'University Hospital',
        imagePath: './assets/images/health-university.jpg',
        address: '2451 Hospital Dr, Mobile',
        rating: 2.8,
        reviewCount: 293,
        distance: 5.5,
        distanceTime: 100));

    return medicalCenters;
  }
}
