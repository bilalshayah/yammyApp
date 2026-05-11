import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/router/app_router.dart';
import 'package:yammyapp/features/auth/presentation/widgets/auth_input.dart';
import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/constants/app_appbar.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/validators/validators.dart';
import '../../../../core/widgets/icon_container.dart';
import '../../../../core/widgets/auth_button.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordEmailSent) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("تحقق من بريدك"),
              content: const Text("لقد أرسلنا رابطاً لتغيير كلمة المرور إلى إيميلك. يرجى الضغط عليه من هناك."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("حسناً"),
                ),
              ],
            ),
          );
        }
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Welcome! Login Success"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushNamedAndRemoveUntil(context, AppRouter.home,(route) => false);
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.activeCategory,
          extendBody: true,
          appBar: AppAppBar(
            text: "Log In",
            function: () => Navigator.pop(context),
          ),
          bottomNavigationBar: const NavBar(),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: context.screenHeight,
                margin: EdgeInsets.only(
                  top: context.screenHeight * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.06,
                  vertical: context.screenHeight * 0.03,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.screenWidth * 0.12),
                    topRight: Radius.circular(context.screenWidth * 0.12),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: AppTextStyles.h2(),
                        ),
                        SizedBox(height: context.screenHeight * 0.01),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        ),
                        SizedBox(height: context.screenHeight * 0.03),
                        AuthInput(
                          title: "Email",
                          type: "email",
                          controller: emailCont,
                          validator: (value) => Validators.validateEmail(value),
                        ),
                        AuthInput(
                          title: "Password",
                          type: "password",
                          controller: passCont,
                          validator: (value) => Validators.validatePassword(value),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
// داخل LoginScreen - زر Forget Password
                            onPressed: () {
                              if (emailCont.text.isNotEmpty) {
                                // إرسال الحدث لطلب التوكين من السيرفر
                                context.read<AuthBloc>().add(
                                  ForgetPasswordRequested(email: emailCont.text),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("الرجاء إدخال الإيميل أولاً")),
                                );
                              }
                            },                            child: Text(
                              "Forget Password",
                              style: AppTextStyles.h3(color: AppColors.textOrange).copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.03),
                        state is AuthLoading ?
                         Center(child: CircularProgressIndicator()) :
                          AuthButton(
                          text: "Log In",
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                LoginSubmitted(
                                  email : emailCont.text,
                                  password : passCont.text,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: context.screenHeight * 0.04),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "or sign up with",
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconContainer(path: "assets/icons/Gmail.svg"),
                            SizedBox(width: 20),
                            IconContainer(path: "assets/icons/Facebook.svg"),
                            SizedBox(width: 20),
                            GestureDetector(
                                onTap: () => Navigator.pushNamed(context, AppRouter.fingerprint),
                                child: IconContainer(path: "assets/icons/Mark.svg")),
                          ],
                        ),
                        SizedBox(height: context.screenHeight * 0.03),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, AppRouter.register),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              Text(
                                "Sign Up",
                                style: AppTextStyles.h3(
                                  color: AppColors.textOrange,
                                ).copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.1),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
