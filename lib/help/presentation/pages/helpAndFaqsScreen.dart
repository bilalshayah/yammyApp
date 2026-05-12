import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_appbar.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/buildToggleButtons.dart';

class HelpAndFaqsScreen extends StatelessWidget {
  const HelpAndFaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.activeCategory,
      appBar:  AppAppBar(text: 'Help & FAQs', iSArrowIcon: true,function: (){
        Navigator.pop(context);
      },
      subTitle: "How can we help you",
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            buildToggleButtons(context,false),
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ExpansionTile(
                    title: const Text("Lorem ipsum dolor sit amet?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}