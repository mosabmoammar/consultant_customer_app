import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(title),
      titleTextStyle: context.textTheme.headlineMedium,
      titleSpacing: 0.0,
      leading: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(child: SvgPicture.asset(SvgAssets.arrowLeft)),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
