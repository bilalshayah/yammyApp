import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/constants/appTextStyle.dart';
import 'package:yammyapp/core/constants/app_colors.dart';
import '../../../../core/constants/app_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_field.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../bloc/profile/profileBloc.dart';
import '../bloc/profile/profileEvent.dart';
import '../bloc/profile/profileState.dart';
import '../widgets/buildProfileBody.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(Dio())..add(GetProfileData()),
      child: Scaffold(
        bottomNavigationBar: const NavBar(currentIndex: 0),
        appBar: AppAppBar(text: "My profile",iSArrowIcon: true,function: (){
          Navigator.pop(context);
        },),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileSuccess) {
              _nameController.text = "${state.user.firstName} ${state.user.lastName}";
              _emailController.text = state.user.email;
              _phoneController.text = state.user.phone ?? "";
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileSuccess) {
              return buildProfileBody(
                user: state.user,
                context: context,
                nameController: _nameController,
                emailController: _emailController,
                phoneController: _phoneController,
              );
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("حدث خطأ ما"));
            }
          },
        ),
      ),
    );
  }
}
