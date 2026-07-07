import 'package:consultant_customer_app/core/common/mock_data/mock_data.dart';
import 'package:consultant_customer_app/core/utils/date_helper.dart';
import 'package:consultant_customer_app/features/notification/domain/models/notification_model.dart';
import 'package:consultant_customer_app/features/notification/presentation/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotificationModel>>(
      future: MockData.getMockNotifications(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('Error loading notifications'));
        }

        final rawNotifications = snapshot.data!;

        if (rawNotifications.isEmpty) {
          return const Center(child: Text('No notifications yet.'));
        }

        rawNotifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        final Map<String, List<NotificationModel>> groupedNotifications = {};

        for (var notification in rawNotifications) {
          final header = DateHelper.getGroupHeader(notification.createdAt);
          if (!groupedNotifications.containsKey(header)) {
            groupedNotifications[header] = [];
          }
          groupedNotifications[header]!.add(notification);
        }

        final groupHeaders = groupedNotifications.keys.toList();

        return ListView.separated(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16.0),
          separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          itemCount: groupHeaders.length,
          itemBuilder: (context, index) {
            final header = groupHeaders[index];
            final notificationsForThisDay = groupedNotifications[header]!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(header),

                ...notificationsForThisDay.map((notification) {
                  return Column(
                    children: [
                      NotificationCard(notification: notification),
                      const SizedBox(height: 4.0),
                    ],
                  );
                }),
              ],
            );
          },
        );
      },
    );
  }
}
