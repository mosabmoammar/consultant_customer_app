// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import "../../../../../../core/common/mock_data/mock_data.dart";
import '../../../../../../core/constants/assets_manager/image_assets.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/widgets/rate_widget.dart';
import '../../../../../../core/widgets/user_image_profile.dart';
import '../../../home/presentation/widgets/header_list.dart';
import '../../domain/entities/promo_ad_data.dart';

class ConsultantTapScreen extends StatelessWidget {
  const ConsultantTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),

        // Promo Banner Section
        const SliverToBoxAdapter(child: _PromoBannerSection()),

        // Category Section
        const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
        const SliverToBoxAdapter(child: _CategorySection()),

        // Recommended Section
        const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
        const SliverToBoxAdapter(child: _RecommendedSection()),

        // Top Rated Doctor Section
        const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
        const SliverToBoxAdapter(child: _TopRatedSection()),

        // Refer and Earn Section
        const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
        const SliverToBoxAdapter(child: _ReferAndEarnSection()),

        const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
      ],
    );
  }
}

class _ReferAndEarnSection extends StatelessWidget {
  const _ReferAndEarnSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 107.0,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(ImageAssets.financialAdvisor, fit: .cover),
            ),

            Positioned.fill(
              child: Container(
                color: context.colorScheme.primary.withValues(alpha: 0.85),
              ),
            ),

            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'Refer and Earn',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Invite your friend and\nget rewards',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.discount_rounded,
                      color: context.colorScheme.onPrimary,
                      size: 60,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopRatedSection extends StatelessWidget {
  const _TopRatedSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: HeaderList(title: 'Top Rated Doctor', onTap: () {}),
        ),
        const SizedBox(height: 12.0),

        // ListView
        ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = MockData.recommendedSection[index];

            return _TopRatedItem(
              image: data['image'],
              name: data['name'],
              specialization: data['specialization'],
              rate: data['rate'],
              status: data['status'],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          itemCount: MockData.recommendedSection.length,
        ),
      ],
    );
  }
}

class _TopRatedItem extends StatelessWidget {
  final String image;
  final bool status;
  final String name;
  final String specialization;
  final double rate;
  const _TopRatedItem({
    required this.image,
    required this.status,
    required this.name,
    required this.specialization,
    required this.rate,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: context.colorScheme.surfaceContainerHigh,
      ),
      height: 72.0,
      child: Row(
        children: [
          // Image
          UserImageProfile(image: image, status: status),
          const SizedBox(width: 16.0),

          // Name and Specialization
          Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                name,
                style: context.textTheme.titleMedium?.copyWith(height: 1.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                specialization,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14.0,
                  height: 1.0,
                ),
              ),
            ],
          ),

          const Spacer(),
          // Rate
          RateWidget(rate: rate),
        ],
      ),
    );
  }
}

class _RecommendedSection extends StatelessWidget {
  const _RecommendedSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: HeaderList(title: 'Recommended', onTap: () {}),
        ),

        // Row of category
        const SizedBox(height: 12.0),
        Container(
          height: 176.0,
          padding: const EdgeInsets.only(left: 16.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final recommended = MockData.recommendedSection[index];
              return _RecommendedListItem(
                image: recommended['image'],
                name: recommended['name'],
                specialization: recommended['specialization'],
                rate: recommended['rate'],
                status: recommended['status'],
              );
            },
            separatorBuilder: (_, _) => const SizedBox(width: 8.0),
            itemCount: MockData.recommendedSection.length,
            scrollDirection: .horizontal,
            padding: const EdgeInsets.only(right: 16.0),
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}

class _RecommendedListItem extends StatelessWidget {
  final String? image;
  final String name;
  final String specialization;
  final double rate;
  final bool status;
  const _RecommendedListItem({
    this.image,
    required this.name,
    required this.specialization,
    required this.rate,
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176.0,
      width: 148.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[200]!, width: 2.0),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          // Image
          UserImageProfile(image: image, status: status),
          const SizedBox(height: 8.0),

          // Name
          Text(
            name,
            style: context.textTheme.titleMedium?.copyWith(fontSize: 16.0),
          ),
          const SizedBox(height: 4.0),

          // Specialization
          Text(
            specialization,
            style: context.textTheme.bodySmall?.copyWith(
              height: 1.0,
              fontSize: 12.0,
              color: context.colorScheme.onTertiary,
            ),
          ),
          const SizedBox(height: 8.0),

          // Rate
          RateWidget(rate: rate),
        ],
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: HeaderList(title: 'Choose your Category', onTap: () {}),
        ),

        // Row of category
        const SizedBox(height: 12.0),
        Container(
          height: 173.0,
          padding: const EdgeInsets.only(left: 16.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final category = MockData.jobCategories[index];
              return _CategoryListItem(
                image: category['imagePath'],
                title: category['text'],
              );
            },
            separatorBuilder: (_, _) => const SizedBox(width: 8.0),
            itemCount: MockData.jobCategories.length,
            scrollDirection: .horizontal,
            padding: const EdgeInsets.only(right: 16.0),
            physics: const BouncingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}

class _CategoryListItem extends StatelessWidget {
  final String image;
  final String title;
  const _CategoryListItem({required this.image, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.0,
      height: 173.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: .antiAlias,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(image, fit: .cover)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withAlpha(10),
                    Colors.black.withAlpha(250),
                  ],
                  stops: const [0.5, 0.7, 1.0],
                ),
              ),
            ),
          ),

          Positioned(
            left: 16.0,
            bottom: 16.0,
            child: Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                fontSize: 16.0,
                height: 1.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoBannerSection extends StatelessWidget {
  const _PromoBannerSection();

  @override
  Widget build(BuildContext context) {
    final ads = <PromoAdData>[
      const PromoAdData(
        imageProvider: AssetImage(ImageAssets.financialAdvisor),
        title: 'Expert Financial Guidance',
        subtitle: 'Book a trusted advisor for your next move.',
        ctaLabel: 'Explore',
      ),
      const PromoAdData(
        imageProvider: AssetImage(ImageAssets.financialAdvisor),
        title: 'Smart Planning Session',
        subtitle: 'Turn goals into a clear action plan.',
        ctaLabel: 'View offer',
      ),
      const PromoAdData(
        imageProvider: AssetImage(ImageAssets.financialAdvisor),
        title: 'Your Next Opportunity',
        subtitle: 'Get matched with the right specialist.',
        ctaLabel: 'See details',
      ),
    ];

    return Container(
      height: 140.0,
      padding: const EdgeInsets.only(left: 16.0),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 8.0, right: 16.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: ads.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12.0),
        itemBuilder: (context, index) {
          return _AdsItem(
            index: index,
            totalAds: ads.length,
            adData: ads[index],
          );
        },
      ),
    );
  }
}

class _AdsItem extends StatelessWidget {
  final int index;
  final int totalAds;
  final PromoAdData adData;

  const _AdsItem({
    required this.index,
    required this.totalAds,
    required this.adData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 140,
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: adData.imageProvider,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primaryContainer,
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                        ],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported_outlined),
                  );
                },
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withAlpha(40),
                      Colors.black.withAlpha(150),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(28),
                        borderRadius: BorderRadius.circular(999.0),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Text(
                        adData.ctaLabel,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      adData.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      adData.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white.withAlpha(220),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(110),
                    borderRadius: BorderRadius.circular(999.0),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Text(
                    '${index + 1}/$totalAds',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
