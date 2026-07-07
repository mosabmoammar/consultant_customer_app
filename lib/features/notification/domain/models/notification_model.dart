import 'notification_type.dart';

class NotificationModel {
  final String id;
  final String title;
  final String subtitle;
  final NotificationType type;
  final bool isRead;
  final DateTime createdAt;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.isRead,
    required this.createdAt,
  });
}