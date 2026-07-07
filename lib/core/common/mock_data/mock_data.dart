import '../../../features/notification/domain/models/notification_model.dart';
import '../../../features/notification/domain/models/notification_type.dart';
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

  static Future<List<NotificationModel>> getMockNotifications() async {
    // Simulating half a second of network latency
    await Future.delayed(const Duration(milliseconds: 500));

    final now = DateTime.now();

    return [
      // ==================== TODAY ====================
      NotificationModel(
        id: '1',
        title: 'New Message from Support',
        subtitle:
            'Hello, your support ticket #3402 has been updated. Please check the response from our agent.',
        type: NotificationType.message,
        isRead: false,
        createdAt: now.subtract(const Duration(minutes: 10)),
      ),
      NotificationModel(
        id: '2',
        title: 'Deposit Successful',
        subtitle:
            'A transfer of \$1,250.00 has been completed successfully via Bank Wire to your primary account.',
        type: NotificationType.deposit,
        isRead: true,
        createdAt: now.subtract(const Duration(hours: 1)),
      ),
      NotificationModel(
        id: '3',
        title: 'Missed Call',
        subtitle:
            'You have a missed call from Consultant Dr. Sarah Ahmed regarding your consulting session.',
        type: NotificationType.missedCall,
        isRead: false,
        createdAt: now.subtract(const Duration(hours: 3)),
      ),
      NotificationModel(
        id: '4',
        title: 'Outgoing Call Connected',
        subtitle:
            'Call to client John Doe completed successfully. Duration: 14 minutes and 22 seconds.',
        type: NotificationType.outgoingCall,
        isRead: true,
        createdAt: now.subtract(const Duration(hours: 5)),
      ),
      NotificationModel(
        id: '5',
        title: 'Security Alert',
        subtitle:
            'A new login was detected from a new device (Chrome/Mac OS) near Cairo, Egypt. If this wasn\'t you, change your password.',
        type: NotificationType.appSystem,
        isRead: false,
        createdAt: now.subtract(const Duration(hours: 7)),
      ),

      // ==================== YESTERDAY ====================
      NotificationModel(
        id: '6',
        title: 'Funds Withdrawal Approved',
        subtitle:
            'Your withdrawal request for \$340.00 to your PayPal account has been processed and sent.',
        type: NotificationType.withdraw,
        isRead: true,
        createdAt: now.subtract(const Duration(days: 1, hours: 2)),
      ),
      NotificationModel(
        id: '7',
        title: 'New Message from Client',
        subtitle:
            'Hey there! Can we reschedule our consultation meeting to next Thursday at 4:00 PM instead?',
        type: NotificationType.message,
        isRead: false,
        createdAt: now.subtract(const Duration(days: 1, hours: 4)),
      ),
      NotificationModel(
        id: '8',
        title: 'Missed Call',
        subtitle:
            'Voice call invitation missed from Engineering Consultant Team Hub.',
        type: NotificationType.missedCall,
        isRead: true,
        createdAt: now.subtract(const Duration(days: 1, hours: 8)),
      ),
      NotificationModel(
        id: '9',
        title: 'System Maintenance Notice',
        subtitle:
            'Our servers will undergo scheduled maintenance tonight between 2:00 AM and 4:00 AM UTC. Expect brief interruptions.',
        type: NotificationType.appSystem,
        isRead: true,
        createdAt: now.subtract(const Duration(days: 1, hours: 11)),
      ),

      // ==================== 28 JUN 2026 ====================
      NotificationModel(
        id: '10',
        title: 'Deposit Received',
        subtitle:
            'Payment received! \$450.00 was deposited into your wallet balance by Milestone Payment contract.',
        type: NotificationType.deposit,
        isRead: true,
        createdAt: DateTime(2026, 6, 28, 16, 45),
      ),
      NotificationModel(
        id: '11',
        title: 'New Chat Notification',
        subtitle:
            'Your consultant has sent over the case study PDF file. Please review it before the weekend.',
        type: NotificationType.message,
        isRead: true,
        createdAt: DateTime(2026, 6, 28, 11, 20),
      ),
      NotificationModel(
        id: '12',
        title: 'Outgoing Call',
        subtitle:
            'Follow-up call with Premium Client handled by customer success. Duration: 5m 12s.',
        type: NotificationType.outgoingCall,
        isRead: true,
        createdAt: DateTime(2026, 6, 28, 09, 15),
      ),

      // ==================== 15 JUN 2026 ====================
      NotificationModel(
        id: '13',
        title: 'Withdrawal Completed',
        subtitle:
            'Successfully transferred \$900.00 to your linked Visa Credit Card ending in *8832.',
        type: NotificationType.withdraw,
        isRead: true,
        createdAt: DateTime(2026, 6, 15, 22, 10),
      ),
      NotificationModel(
        id: '14',
        title: 'App Promotion',
        subtitle:
            'Congratulations! You unlocked the Premium Badge for completing 10 successful consultation sessions this month.',
        type: NotificationType.appSystem,
        isRead: true,
        createdAt: DateTime(2026, 6, 15, 14, 05),
      ),
      NotificationModel(
        id: '15',
        title: 'Missed Call',
        subtitle: 'Urgent missed call from Financial Supervisor Department.',
        type: NotificationType.missedCall,
        isRead: false,
        createdAt: DateTime(2026, 6, 15, 08, 30),
      ),

      // ==================== MAY 2026 ====================
      NotificationModel(
        id: '16',
        title: 'Profile Approved',
        subtitle:
            'Great news! Your identity documents have been fully verified. Your account limits are now expanded.',
        type: NotificationType.appSystem,
        isRead: true,
        createdAt: DateTime(2026, 5, 20, 12, 00),
      ),
      NotificationModel(
        id: '17',
        title: 'New Message from Support',
        subtitle:
            'We have updated our terms of service regarding payment schedules. Tap here to read the full document details.',
        type: NotificationType.message,
        isRead: true,
        createdAt: DateTime(2026, 5, 19, 15, 40),
      ),
      NotificationModel(
        id: '18',
        title: 'Deposit Successful',
        subtitle:
            'Bonus deposit added! You received \$50.00 loyalty cash back into your standard app wallet.',
        type: NotificationType.deposit,
        isRead: true,
        createdAt: DateTime(2026, 5, 10, 10, 15),
      ),
      NotificationModel(
        id: '19',
        title: 'Outgoing Call',
        subtitle:
            'Initial orientation briefing call with New Coach. Duration: 32 minutes.',
        type: NotificationType.outgoingCall,
        isRead: true,
        createdAt: DateTime(2026, 5, 02, 11, 00),
      ),

      // ==================== APRIL 2026 ====================
      NotificationModel(
        id: '20',
        title: 'Withdrawal Rejected',
        subtitle:
            'Your withdrawal request of \$1,500.00 was declined due to insufficient documentation. Contact help desk.',
        type: NotificationType.withdraw,
        isRead: true,
        createdAt: DateTime(2026, 4, 25, 17, 45),
      ),
      NotificationModel(
        id: '21',
        title: 'New Offline Message',
        subtitle:
            'An offline query was left on your dashboard: \"Is there any availability for emergency consultations on weekends?\"',
        type: NotificationType.message,
        isRead: true,
        createdAt: DateTime(2026, 4, 18, 23, 12),
      ),
      NotificationModel(
        id: '22',
        title: 'Missed Call',
        subtitle:
            'Missed call notification from unknown business number +1-800-443-221.',
        type: NotificationType.missedCall,
        isRead: true,
        createdAt: DateTime(2026, 4, 11, 14, 55),
      ),

      // ==================== MARCH 2026 ====================
      NotificationModel(
        id: '23',
        title: 'App Update Released',
        subtitle:
            'Version 2.0.5 is out! Bug fixes for chat file uploading and optimized performance for low network speeds.',
        type: NotificationType.appSystem,
        isRead: true,
        createdAt: DateTime(2026, 3, 30, 09, 00),
      ),
      NotificationModel(
        id: '24',
        title: 'Deposit From Client',
        subtitle:
            'Advance payment contract confirmed! \$800.00 locked and cleared for Contract ID #9921.',
        type: NotificationType.deposit,
        isRead: true,
        createdAt: DateTime(2026, 3, 14, 13, 10),
      ),
      NotificationModel(
        id: '25',
        title: 'Outgoing Call',
        subtitle:
            'Closing feedback and evaluation loop call with project supervisor. Duration: 18m 40s.',
        type: NotificationType.outgoingCall,
        isRead: true,
        createdAt: DateTime(2026, 3, 03, 16, 20),
      ),

      // ==================== ARCHIVED FROM 2025 ====================
      NotificationModel(
        id: '26',
        title: 'End of Year Report',
        subtitle:
            'Your 2025 annual consultation summary and tax invoices are now ready for download in PDF format.',
        type: NotificationType.appSystem,
        isRead: true,
        createdAt: DateTime(2025, 12, 31, 23, 59),
      ),
      NotificationModel(
        id: '27',
        title: 'Holiday Greetings!',
        subtitle:
            'Warmest wishes from the app team! We hope you have an incredible holiday season and a prosperous new year ahead.',
        type: NotificationType.appSystem,
        isRead: true,
        createdAt: DateTime(2025, 12, 24, 10, 00),
      ),
      NotificationModel(
        id: '28',
        title: 'Large Withdrawal Done',
        subtitle:
            'Annual payout processed. \$4,300.00 migrated safely to your registered corporate checking account.',
        type: NotificationType.withdraw,
        isRead: true,
        createdAt: DateTime(2025, 11, 15, 11, 30),
      ),
      NotificationModel(
        id: '29',
        title: 'Archived Client Message',
        subtitle:
            'Old archived text thread: \"Thank you for the wonderful consultation, the advice really helped save our corporate strategy.\"',
        type: NotificationType.message,
        isRead: true,
        createdAt: DateTime(2025, 10, 05, 14, 12),
      ),
      NotificationModel(
        id: '30',
        title: 'First Account Deposit',
        subtitle:
            'Welcome deposit! Your first test fund of \$10.00 was successfully added during account opening configuration.',
        type: NotificationType.deposit,
        isRead: true,
        createdAt: DateTime(2025, 09, 01, 09, 00),
      ),
    ];
  }
}
