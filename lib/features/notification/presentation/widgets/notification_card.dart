import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/features/notification/domain/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final String formattedTime = DateFormat(
      'hh:mm a',
    ).format(notification.createdAt);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        children: [
          Center(child: _buildSvgIcon(notification.type)),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.title, style: context.textTheme.titleMedium),
                const SizedBox(height: 4.0),
                Text(
                  notification.subtitle,
                  style: context.textTheme.bodyMedium?.copyWith(height: 1.0),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  formattedTime,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 12.0,
                    height: 1.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          if (!notification.isRead)
            Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSvgIcon(dynamic type) {
    return SvgPicture.asset(
      type.svgPath,
      placeholderBuilder: (BuildContext context) =>
          Icon(_getFallbackIcon(type)),
    );
  }

  IconData _getFallbackIcon(dynamic type) {
    switch (type) {
      case 'message':
        return Icons.chat_bubble_outline_rounded;
      case 'outgoingCall':
        return Icons.call_made_rounded;
      case 'missedCall':
        return Icons.call_missed_rounded;
      case 'appSystem':
        return Icons.notifications_none_rounded;
      case 'deposit':
        return Icons.arrow_downward_rounded;
      case 'withdraw':
        return Icons.arrow_upward_rounded;
      default:
        return Icons.notifications;
    }
  }
}
