import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmer(double height) {
  return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        height: height,
        width: double.infinity,
      ));
}
