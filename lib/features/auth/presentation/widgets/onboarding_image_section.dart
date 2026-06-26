import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/onboarding_providers.dart';
import '../providers/onboarding_state.dart';

class OnboardingImageSection extends ConsumerStatefulWidget {
  const OnboardingImageSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingImageSectionState();
}

class _OnboardingImageSectionState
    extends ConsumerState<OnboardingImageSection> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();

    // PageController initialized with virtual page from state
    _controller = PageController(
      initialPage: OnboardingState.initialVirtualPage,
    );

    // Start auto-scroll via notifier — no Timer in widget
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(onboardingProvider.notifier).startAutoScroll(() {
        if (!_controller.hasClients) return;
        _controller.animateToPage(
          ref.read(onboardingProvider.notifier).nextVirtualPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(onboardingItemsProvider);
    final currentPage = ref.watch(
      onboardingProvider.select((value) => value.currentPage),
    );
    return result.fold(
      (failure) => _ErrorPlaceHolder(message: failure.message),
      (items) => ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.s16),
        child: Stack(
          children: [
            // PageView
            PageView.builder(
              controller: _controller,
              itemCount: OnboardingState.virtualPageCount,
              onPageChanged: (virtualPage) => ref
                  .read(onboardingProvider.notifier)
                  .onVirtualPageChanged(virtualPage, items.length),
              itemBuilder: (_, virtualPage) {
                // Index calculated delegated to state
                final real = ref
                    .read(onboardingProvider)
                    .realIndexFrom(virtualPage, items.length);

                return _OnboardingPage(
                  imagePath: items[real].imagePath,
                  title: items[real].title,
                  subtitle: items[real].subtitle,
                );
              },
            ),

            // Animated linear indicator
            Positioned(
              bottom: AppSpacing.s10,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  items.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 280),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.s4,
                    ),
                    width: AppSpacing.s32,
                    height: AppSpacing.s2,
                    decoration: BoxDecoration(
                      color: index == currentPage
                          ? AppColors.lightGray3
                          : AppColors.darkGray6,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pure presentational page
class _OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const _OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(imagePath, fit: BoxFit.cover),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.45, 1.0],
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          right: 20.0,
          bottom: 44.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: AppSpacing.s8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Error Placeholder
class _ErrorPlaceHolder extends StatelessWidget {
  final String message;

  const _ErrorPlaceHolder({required this.message});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.s16),
      child: Container(
        color: Colors.grey.shade100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.s16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.image_not_supported_outlined,
                  size: AppSpacing.s48,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: AppSpacing.s12),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
