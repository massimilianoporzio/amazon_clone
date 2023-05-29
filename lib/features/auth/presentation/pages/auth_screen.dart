import 'package:amazon_clone/app/resources/color_manager.dart';
import 'package:amazon_clone/core/presentation/widgets/custom_button.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../domain/entities/enums/auth_type.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.greyBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListTile(
                    tileColor: state.authType == AuthType.signUp
                        ? ColorManager.backgroundColor
                        : ColorManager.greyBackgroundColor,
                    title: const Text('Create Account'),
                    leading: Radio<AuthType>(
                      activeColor: ColorManager.secondaryColor,
                      value: AuthType.signUp,
                      groupValue: state.authType,
                      onChanged: (value) {
                        context.read<AuthCubit>().setAuthType(value!);
                      },
                    ),
                  ),
                  Visibility(
                    visible: state.authType == AuthType.signUp,
                    key: _signupFormKey,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: ColorManager.backgroundColor,
                      child: Form(
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _nameController,
                              hintText: "Name",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              text: "Sign Up",
                              onTap: () {
                                //use the formKey and do validation
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    tileColor: state.authType == AuthType.signIn
                        ? ColorManager.backgroundColor
                        : ColorManager.greyBackgroundColor,
                    title: const Text('Sign In'),
                    leading: Radio<AuthType>(
                      activeColor: ColorManager.secondaryColor,
                      value: AuthType.signIn,
                      groupValue: state.authType,
                      onChanged: (value) {
                        context.read<AuthCubit>().setAuthType(value!);
                      },
                    ),
                  ),
                  Visibility(
                    visible: state.authType == AuthType.signIn,
                    key: _signinFormKey,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: ColorManager.backgroundColor,
                      child: Form(
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              text: "Sign In",
                              onTap: () {
                                //use the formKey and do validation
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
