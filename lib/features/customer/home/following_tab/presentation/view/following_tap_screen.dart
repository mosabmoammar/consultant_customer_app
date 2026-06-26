import 'package:flutter/material.dart';

class FollowingTapScreen extends StatelessWidget {
  const FollowingTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        const SliverFillRemaining(
          child: Center(child: Text("Following Screen")),
        ),
      ],
    );
  }
}
