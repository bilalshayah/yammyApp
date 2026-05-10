import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yammyapp/core/validators/validators.dart';
import '../../../../core/constants/appTextStyle.dart';
import '../../../../core/constants/app_appbar.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/icon_container.dart';
import '../../../../core/widgets/auth_button.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_input.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController fNameCont = TextEditingController();
  final TextEditingController lNameCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();

  @override
  void dispose() {
    passCont.dispose();
    emailCont.dispose();
    fNameCont.dispose();
    lNameCont.dispose();
    phoneCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print(state);
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Welcome! Signup Success"),
              backgroundColor: Colors.green,
            ),
          );
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
            function: () => Navigator.pop(context),
            text: "New Account",
          ),
          bottomNavigationBar: const NavBar(),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: context.screenHeight,
                margin: EdgeInsets.only(top: context.screenHeight * 0.02),
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
                        AuthInput(
                          title: "First name",
                          type: "name",
                          controller: fNameCont,
                          validator: (value) => Validators.validateFullName(value),
                        ),
                        AuthInput(
                          title: "Last name",
                          type: "name",
                          controller: lNameCont,
                          validator: (value) => Validators.validateFullName(value),
                        ),
                        AuthInput(
                          title: "Password",
                          type: "password",
                          controller: passCont,
                          validator: (value) => Validators.validatePassword(value),
                        ),
                        AuthInput(
                          title: "Email",
                          type: "email",
                          controller: emailCont,
                          validator: (value) => Validators.validateEmail(value),
                        ),
                        SizedBox(height: context.screenHeight * 0.03),
                        AuthInput(
                          title: "Mobile Number",
                          type: "phone",
                          controller: phoneCont,
                          validator: (value) => Validators.validatePhone(value),
                        ),
                        SizedBox(height: context.screenHeight * 0.03),
                        Center(
                          child: SizedBox(
                            width: context.screenWidth * 0.8,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'By continuing, you agree to \n',
                                style: AppTextStyles.subtitle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Use ',
                                    style: AppTextStyles.subtitle(color: AppColors.primary).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: 'and ', style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                    text: 'Privacy Policy.',
                                    style: AppTextStyles.subtitle(color: AppColors.primary).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: context.screenHeight * 0.025),
                        state is AuthLoading
                            ? const Center(child: CircularProgressIndicator())
                            : AuthButton(
                          text: "Sign Up",
                          function: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                RegisterSubmitted(
                                  email: emailCont.text,
                                  password: passCont.text,
                                  firstName: fNameCont.text,
                                  lastName: lNameCont.text,
                                  phone: phoneCont.text,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: context.screenHeight * 0.04),
                        Column(
                          children: [
                            Text("or sign up with", style: AppTextStyles.h3()),
                            SizedBox(height: context.screenHeight * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const IconContainer(path: "assets/icons/Gmail.svg"),
                                SizedBox(width: context.screenWidth * 0.05),
                                const IconContainer(path: "assets/icons/Facebook.svg"),
                                SizedBox(width: context.screenWidth * 0.05),
                                const IconContainer(path: "assets/icons/Mark.svg"),
                              ],
                            ),
                            SizedBox(height: context.screenHeight * 0.03),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Already have an account? "),
                                  Text(
                                    "Log In",
                                    style: AppTextStyles.h3(color: AppColors.textOrange).copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: context.screenHeight * 0.1),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  });
 }
}
