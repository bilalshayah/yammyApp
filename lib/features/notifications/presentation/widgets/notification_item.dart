import 'package:flutter/material.dart';
import 'package:yammyapp/core/constants/svg_icon.dart';

class NotificationItem extends StatelessWidget {
  final String path;
  final String text;

  const NotificationItem({super.key, required this.path, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgIcon(path: path),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.white54, thickness: 1, indent: 10, endIndent: 10),
      ],
    );
  }
}
