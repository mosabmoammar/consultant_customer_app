import '../../constants/assets_manager/image_assets.dart';

class MockData {
  static final List<Map<String, dynamic>> jobCategories = [
    {'id': 1, 'imagePath': ImageAssets.astrologer, 'text': 'Astrologer'},
    {'id': 2, 'imagePath': ImageAssets.doctor, 'text': 'Doctor'},
    {
      'id': 3,
      'imagePath': ImageAssets.financialAdvisor,
      'text': 'Financial Advisor',
    },
    {'id': 4, 'imagePath': ImageAssets.lawyer, 'text': 'Lawyer'},
    {'id': 5, 'imagePath': ImageAssets.psychologist, 'text': 'Psychologist'},
    {'id': 6, 'imagePath': ImageAssets.doctor, 'text': 'Real Estate'},
    {'id': 7, 'imagePath': ImageAssets.tutors, 'text': 'Tutors'},
    {'id': 8, 'imagePath': ImageAssets.youtubers, 'text': 'Youtubers'},
  ];

  static final List<Map<String, dynamic>> recommendedSection = [
    {
      'id': 1,
      'image': ImageAssets.doctor,
      'name': 'Dr. Vinod Kumar',
      'specialization': 'Orthopedic',
      'rate': 4.0,
      'status': true,
    },
    {
      'id': 2,
      'image': ImageAssets.lawyer,
      'name': 'Rajesh Sharma',
      'specialization': 'Criminal Law',
      'rate': 4.5,
      'status': false,
    },
    {
      'id': 3,
      'image': ImageAssets.psychologist,
      'name': 'Dr. Priya Patel',
      'specialization': 'Clinical Psychology',
      'rate': 4.8,
      'status': true,
    },
    {
      'id': 4,
      'image': ImageAssets.financialAdvisor,
      'name': 'Amit Verma',
      'specialization': 'Investment Planning',
      'rate': 4.3,
      'status': true,
    },
    {
      'id': 5,
      'image': ImageAssets.astrologer,
      'name': 'Swami Anand',
      'specialization': 'Vedic Astrology',
      'rate': 4.2,
      'status': false,
    },
  ];
}
