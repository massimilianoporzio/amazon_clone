import 'package:amazon_clone/app/resources/color_manager.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/enums/auth_type.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

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
                  ListTile(
                    title: const Text('Sign In'),
                    leading: Radio<AuthType>(
                      activeColor: ColorManager.secondaryColor,
                      value: AuthType.signIn,
                      groupValue: state.authType,
                      onChanged: (value) {
                        context.read<AuthCubit>().setAuthType(value!);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
