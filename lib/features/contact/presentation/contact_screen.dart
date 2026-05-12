import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/app_appbar.dart';
import '../../../core/widgets/navigation_bar.dart';
import '../../../help/presentation/widgets/buildToggleButtons.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.activeCategory,
      appBar:  AppAppBar(text: 'Contact Us', iSArrowIcon: true,subTitle: "How can we help you",
      function: (){
        Navigator.pop(context);
      },
      ),
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            buildToggleButtons(context,true),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(25),
                children: [
                  _contactItem(Icons.headset_mic_outlined, "Customer service"),
                  _contactItem(Icons.language, "Website"),
                  _contactItem(Icons.call, "Whatsapp"),
                  _contactItem(Icons.facebook, "Facebook"),
                  _contactItem(Icons.camera_alt_outlined, "Instagram"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.textOrange),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.keyboard_arrow_down),
      ),
    );
  }
}


Widget _toggleTile(String text, bool isActive) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: isActive ? AppColors.textOrange : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: Text(text, style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontWeight: FontWeight.bold)),
    ),
  );
}