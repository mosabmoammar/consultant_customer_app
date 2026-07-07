import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';
import 'package:consultant_customer_app/core/constants/constants.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/shared/widgets/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _recentSearch = ['Hello', 'keep oral', 'litew', 'Noram'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: Constants.searchBarTag,
                    createRectTween: (begin, end) {
                      return MaterialRectCenterArcTween(begin: begin, end: end);
                    },
                    flightShuttleBuilder:
                        (
                          flightContext,
                          animation,
                          direction,
                          fromContext,
                          toContext,
                        ) {
                          return Material(
                            color: Colors.transparent,
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: direction == HeroFlightDirection.pop
                                  ? fromContext.widget
                                  : toContext.widget,
                            ),
                          );
                        },
                    child: const Material(
                      color: Colors.transparent,
                      child: CustomTextField(
                        hintText: 'Search for Consultant',
                        prefixIcon: Icon(Icons.search),
                        enabled: true,
                        autoFocus: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),
            const SizedBox(height: 24.0),

            if (_recentSearch.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        letterSpacing: 0.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _recentSearch.clear();
                        });
                      },
                      borderRadius: BorderRadius.circular(12.0),
                      child: Ink(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'clear search',
                          style: context.textTheme.labelMedium?.copyWith(
                            fontSize: 12.0,
                            height: 1.0,
                            letterSpacing: 0.0,
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _recentSearch[index],
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 14.0,
                            height: 1.0,
                            letterSpacing: 0.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _recentSearch.removeAt(index);
                            });
                          },
                          borderRadius: BorderRadius.circular(100.0),
                          child: Ink(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.asset(SvgAssets.icDelete),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8.0),
                  itemCount: _recentSearch.length,
                ),
              ),
            ] else ...[
              Expanded(
                child: Center(
                  child: Text(
                    'No recent searches',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
