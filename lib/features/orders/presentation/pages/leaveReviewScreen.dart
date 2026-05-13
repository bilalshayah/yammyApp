import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/widgets/navigation_bar.dart';
import 'package:yammyapp/features/orders/presentation/widgets/leaveReview/header.dart';
import 'package:yammyapp/features/orders/presentation/widgets/leaveReview/body.dart';

class Leavereviewscreen extends StatefulWidget {
  final String image;
  final String name;
  const Leavereviewscreen({super.key, required this.image, required this.name});
  @override
  State<Leavereviewscreen> createState() => _LeavereviewscreenState();
}

class _LeavereviewscreenState extends State<Leavereviewscreen> {
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      bottomNavigationBar: NavBar(currentIndex: 3),
      body: Column(
        children: [
          Header(), 
          Expanded(
            child: SingleChildScrollView(
              child: Body(
                image: widget.image,
                name: widget.name,
                textEditingController: _reviewController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
