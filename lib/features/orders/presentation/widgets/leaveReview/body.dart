import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/widgets/custom_button.dart';
import 'package:yammyapp/features/orders/presentation/widgets/leaveReview/starRating.dart';
import 'package:yammyapp/features/orders/presentation/widgets/otherField.dart';

class Body extends StatefulWidget {
  final String image;
  final String name;
  final TextEditingController textEditingController;
  Body({super.key, required this.image, required this.name, required this.textEditingController});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(widget.image),
          ),
          SizedBox(height: 24),
          Text(
            widget.name,
            style: AppTextStyles.h2(color: AppColors.textPrimary),
          ),
          SizedBox(height: 30),
          Text(
            "We'd love to know what you think of your dish.",
            style: AppTextStyles.review(color: AppColors.textPrimary),
          ),
          SizedBox(height: 42),
          StarRating(
            onRatingSelected: (rating) {
              setState(() => _selectedRating = rating);
            },
          ),
          const SizedBox(height: 12),
          Text(
            _selectedRating == 0
                ? 'Select a rating'
                : 'Rating: $_selectedRating/5',
            style: AppTextStyles.h3(),
          ),
          SizedBox(height: 30),
          Text(
            "Leave us your comment!",
            style: AppTextStyles.review(color: AppColors.textPrimary),
          ),
          SizedBox(height: 10),
          OthersField(controller: widget.textEditingController, text: "Write Review..."),
          SizedBox(height: 32,),
         Row(
  children: [
    Expanded(
      child: CustomButton(
        text: 'Cancel',
        color: AppColors.searchBg,
        function: () => Navigator.pop(context),
      ),
    ),
    const SizedBox(width: 8),
    Expanded(
      child: CustomButton(
        text: 'Submit',
        function: () {
          if (_selectedRating == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select a rating first.')),
            );
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Review captured: $_selectedRating stars.',
              ),
            ),
          );
        },
      ),
    ),
  ],
)
        ],
      ),
    );
  }
}
