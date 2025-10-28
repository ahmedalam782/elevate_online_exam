import 'package:flutter/material.dart';

import 'custom_shimmer_container.dart';

class CustomShimmerList extends StatelessWidget {
  const CustomShimmerList({
    super.key,
    this.length = 7,
    this.itemHeight = 120,
    this.shrinkWrap = false,
  });
  final int length;
  final double itemHeight;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: length,
      shrinkWrap: shrinkWrap,
      itemBuilder: (context, index) {
        return CustomShimmerContainer(
          height: itemHeight,
          width: double.infinity,
          borderRadius: 12,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 16);
      },
    );
  }
}
