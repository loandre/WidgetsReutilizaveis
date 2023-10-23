import 'package:flutter/material.dart';

enum ImageSourceType {
  asset,
  network,
}

class CardAssets extends StatefulWidget {
  final ImageSourceType imageSourceType;
  const CardAssets({super.key, required this.imageSourceType});
  const CardAssets.network({
    super.key, required this.imageSourceType});
  const CardAssets.asset({
    super.key, required this.imageSourceType});

  @override
  State<CardAssets> createState() => _CardAssetsState();
}

class _CardAssetsState extends State<CardAssets> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
