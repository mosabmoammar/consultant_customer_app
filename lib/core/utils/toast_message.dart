import 'package:consultant_customer_app/core/services/navigation_service.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/injection/injection_container.dart';

enum ToastType { success, error, warning, info }

OverlayEntry? _currentToastEntry;

void showToast({
  required String message,
  ToastType type = ToastType.success,
  Duration duration = const Duration(seconds: 2),
}) {
  final navigatorState = sl<NavigationService>().navigatorKey.currentState;
  if (navigatorState == null) return;

  final overlayState = navigatorState.overlay;
  if (overlayState == null) return;

  // remove existing toast (prevents stacking)
  _currentToastEntry?.remove();
  _currentToastEntry = null;

  HapticFeedback.lightImpact();

  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) {
      return _ToastAnimatedWidget(
        message: message,
        type: type,
        onDismiss: () {
          entry.remove();
          if (_currentToastEntry == entry) {
            _currentToastEntry = null;
          }
        },
      );
    },
  );

  _currentToastEntry = entry;
  overlayState.insert(entry);

  Future.delayed(duration, () {
    if (entry.mounted) {
      entry.remove();
      if (_currentToastEntry == entry) {
        _currentToastEntry = null;
      }
    }
  });
}

class _ToastAnimatedWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final VoidCallback onDismiss;

  const _ToastAnimatedWidget({
    required this.message,
    required this.type,
    required this.onDismiss,
  });

  @override
  State<_ToastAnimatedWidget> createState() => _ToastAnimatedWidgetState();
}

class _ToastAnimatedWidgetState extends State<_ToastAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fade;
  late Animation<Offset> slide;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );

    fade = CurvedAnimation(parent: controller, curve: Curves.easeOut);

    slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));

    scale = Tween<double>(
      begin: 0.96,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    controller.forward();
  }

  void dismiss() async {
    await controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 24,
      left: 20,
      right: 20,
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: DefaultTextStyle(
            style:
                theme.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                ) ??
                TextStyle(fontSize: 14, color: context.colorScheme.onPrimary),
            child: GestureDetector(
              onTap: dismiss,
              onHorizontalDragEnd: (_) => dismiss(),
              child: FadeTransition(
                opacity: fade,
                child: SlideTransition(
                  position: slide,
                  child: ScaleTransition(
                    scale: scale,
                    child: _ToastBody(
                      message: widget.message,
                      type: widget.type,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ToastBody extends StatelessWidget {
  final String message;
  final ToastType type;

  const _ToastBody({super.key, required this.message, required this.type});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.width * 0.9, minWidth: 100),
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(18),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
