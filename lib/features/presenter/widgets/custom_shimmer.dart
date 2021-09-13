import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;

  const CustomShimmer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: child,
      ),
      baseColor: Colors.grey,
      highlightColor: Colors.white,
    );
  }
}
