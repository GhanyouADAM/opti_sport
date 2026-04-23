import 'package:clima_run/core/constants/app_icon.dart';
import 'package:clima_run/features/authentication/views/widgets/authentication_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/context_extension.dart';

class AuthentificationPage extends ConsumerWidget {
  const AuthentificationPage({
    super.key,
    this.isLogin = true,
    required this.title,
  });
  final bool isLogin;
  final String title;
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column(
            children: [
              SizedBox(height: context.screenHeight * 0.1),
              //<-------------- Icon and title ---------------->
              AppIcon(
                name: 'train_cast_logo_v2',
                size: 150,
                primaryColor: context.colorScheme.primary,
              ),
              Text('OptiSport', style: context.textTheme.headlineLarge),

              SizedBox(height: 40), // Espace entre le logo et le formulaire
              //<-------------- Form and validation ------------->
              AuthenticationForm(title: title, isLogin: isLogin),

              const SizedBox(height: 20), // Espace en bas pour respirer
            ],
          ),
        ),
      ),
    );
  }
}
