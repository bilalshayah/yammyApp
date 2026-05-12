import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildToggleButtons(BuildContext context, bool isContactUs) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 25),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (isContactUs) {

              }
            },
            child: _toggleTile("FAQ", !isContactUs),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (!isContactUs) {

              }
            },
            child: _toggleTile("Contact Us", isContactUs),
          ),
        ),
      ],
    ),
  );
}

Widget _toggleTile(String text, bool isActive) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: isActive ? const Color(0xFFFF8A00) : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  );
}