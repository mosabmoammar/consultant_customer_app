  import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';

enum NotificationType {
  message,
  outgoingCall,
  missedCall,
  appSystem,
  deposit,
  withdraw;

  String get svgPath {
    return switch (this) {
      NotificationType.message => SvgAssets.messageNotification,
      NotificationType.outgoingCall => SvgAssets.outgoingCallNotification,
      NotificationType.missedCall => SvgAssets.missedCallNotification,
      NotificationType.appSystem => SvgAssets.appSystemNotification,
      NotificationType.deposit => SvgAssets.depositNotification,
      NotificationType.withdraw => SvgAssets.withdrawNotification,
    };
  }
}