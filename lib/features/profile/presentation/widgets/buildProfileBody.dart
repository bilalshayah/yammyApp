import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_field.dart';
import '../../data/models/userModel.dart';

Widget buildProfileBody({
  required UserModel user,
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController phoneController,
}) {
  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Stack(
      children: [
        Container(
          height: size.height * 0.12,
          color: AppColors.activeCategory,
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: size.height * 0.025),
              constraints: BoxConstraints(
                minHeight: size.height * 0.85,
              ),
              decoration: BoxDecoration(
                color: AppColors.textWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.2),
                  topRight: Radius.circular(size.width * 0.2),
                ),
              ),
              child: Column(
                children: [
                  _buildAvatarSection(user.avatar, size),

                  SizedBox(height: size.height * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFieldLabel("Full Name", size),
                        CustomField(
                          controller: nameController, 
                          type: "text",
                        ),

                        SizedBox(height: size.height * 0.025),

                        buildFieldLabel("Email", size),
                        CustomField(
                          controller: emailController, 
                          type: "email",
                        ),

                        SizedBox(height: size.height * 0.025),

                        buildFieldLabel("Phone Number", size),
                        CustomField(
                          controller: phoneController, 
                          type: "phone",
                        ),

                        SizedBox(height: size.height * 0.05),

                        CustomButton(
                          text: "Update Profile",
                          function: () {
                          },
                        ),
                        SizedBox(height: size.height * 0.06),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildAvatarSection(String? avatarUrl, Size size) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      Container(
        margin: EdgeInsets.only(top: size.height * 0.025),
        width: size.width * 0.3,
        height: size.width * 0.3,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: size.width * 0.005),
          image: DecorationImage(
            image: (avatarUrl != null && avatarUrl.isNotEmpty)
                ? NetworkImage(avatarUrl)
                : const AssetImage("assets/images/user_profile.png") as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        right: size.width * 0.012,
        bottom: size.width * 0.012,
        child: CircleAvatar(
          radius: size.width * 0.045,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.camera_alt, color: Colors.white, size: size.width * 0.05),
        ),
      ),
    ],
  );
}

Widget buildFieldLabel(String label, Size size) {
  return Padding(
    padding: EdgeInsets.only(bottom: size.height * 0.01, left: size.width * 0.01),
    child: Text(
      label,
      style: AppTextStyles.h3(color: AppColors.textPrimary),
    ),
  );
}