import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';

class StarRating extends StatefulWidget {
  final Function(int) onRatingSelected;
  const StarRating({super.key, required this.onRatingSelected});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() => _rating = index + 1);
            widget.onRatingSelected(index + 1);
          },
          child: Icon(
            index < _rating ? Icons.star : Icons.star_border,
            color: AppColors.primary,
            size: 36,
          ),
        );
      }),
    );
  }
}