import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import '../../../../core/constants/app_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_field.dart';
import '../bloc/profileBloc.dart';
import '../bloc/profileEvent.dart';
import '../bloc/profileState.dart';
import '../widgets/buildProfileBody.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: "John Smith");
  final TextEditingController _dateController = TextEditingController(text: "09 / 10 / 1991");
  final TextEditingController _emailController = TextEditingController(text: "johnsmith@example.com");
  final TextEditingController _phoneController = TextEditingController(text: "+123 567 89000");

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(Dio())..add(GetProfileData()),
      child: Scaffold(
        appBar: AppAppBar(text: "My profile"),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccess) {
              _nameController.text = "${state.user.firstName} ${state.user.lastName}";
              _emailController.text = state.user.email;
              _phoneController.text = state.user.phone!;

              return buildProfileBody(
                user: state.user,
                context: context,
                nameController: _nameController,
                emailController: _emailController,
                phoneController: _phoneController,
              );;
            } else {
              return const Center(child: Text("حدث خطأ ما"));
            }
          },
        ),
      ),
    );
  }


}