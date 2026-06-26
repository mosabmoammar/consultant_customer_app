import 'package:flutter/material.dart';

class PromoAdData {
  final ImageProvider imageProvider;
  final String title;
  final String subtitle;
  final String ctaLabel;

  const PromoAdData({
    required this.imageProvider,
    required this.title,
    required this.subtitle,
    required this.ctaLabel,
  });
}