import 'package:elevate_online_exam/features/explore/presentation/view/widgets/explore_body.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: [ExploreBody()]),
    );
  }
}
