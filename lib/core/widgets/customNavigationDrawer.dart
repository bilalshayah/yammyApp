import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      width: size.width * 0.75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textOrange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width * 0.16),
            bottomLeft: Radius.circular(size.width * 0.16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDrawerHeader(size),

            SizedBox(height: size.height * 0.02),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                children: [
                  _drawerItem(Icons.shopping_bag_outlined, "My Orders", size,() {

                  },),
                  _drawerItem(Icons.person_outline, "My Profile", size,() {
                    Navigator.pushNamed(context, "/myProfile");
                  },),
                  _drawerItem(Icons.location_on_outlined, "Delivery Address", size,() {

                  },),
                  _drawerItem(Icons.payment_outlined, "Payment Methods", size,() {

                  },),
                  _drawerItem(Icons.contact_support_outlined, "Contact Us", size,() {

                  },),
                  _drawerItem(Icons.help_outline, "Help & FAQs", size,() {

                  },),
                  _drawerItem(Icons.settings_outlined, "Settings", size,() {

                  },),

                  Divider(color: AppColors.textWhite,),

                  _drawerItem(Icons.logout, "Log Out", size,() {

                  },),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(Size size) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.08,
        left: size.width * 0.08,
        bottom: size.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: size.width * 0.08,
              backgroundImage: const AssetImage('assets/images/person.jpg'),
            ),
          ),
          SizedBox(height: size.height * 0.015),
          Text(
            "hadel Brmo",
            style: AppTextStyles.title(color: Colors.white).copyWith(fontSize: 20),
          ),
          Text(
            "hadelBrmo@email.com",
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, Size size,VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: size.width * 0.06),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(
        vertical: size.height * 0.002,
        horizontal: size.width * 0.02,
      ),
    );
  }
}