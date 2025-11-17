import 'package:flutter/material.dart';

class ShimmerBuildItems extends StatelessWidget {
  const ShimmerBuildItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: 16.0),
        physics: BouncingScrollPhysics(),
        itemCount: 6,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) => Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Expanded(
                child: Container(
                  height: 20,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
