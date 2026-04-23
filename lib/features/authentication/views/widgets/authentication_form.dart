import 'package:clima_run/core/constants/context_extension.dart';
import 'package:clima_run/features/authentication/viewmodels/auth_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthenticationForm extends ConsumerStatefulWidget {
  const AuthenticationForm({
    super.key,
    required this.title,
    this.isLogin = true,
  });
  final String title;
  final bool isLogin;
  @override
  ConsumerState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends ConsumerState<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isObscure = true;
  bool _isSubmitting = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // logique de validation du formulaire
  void _submitForm() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_isSubmitting) {
        return;
      }
      setState(() {
        _isSubmitting = true;
      });
      if (widget.isLogin) {
        // Connexion
        try {
          final result = await ref
              .read(authViewModelProvider.notifier)
              .signInWithEmailAndPassword(email, password);
          result.fold((failure) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  failure.message ??
                      'Une Erreur est survenue lors de l\'authentification',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }, (_) => null);
        } finally {
          if (mounted) {
            setState(() {
              _isSubmitting = false;
            });
          }
        }
      } else {
        // Inscription
        try {
          final result = await ref
              .read(authViewModelProvider.notifier)
              .signUpWithEmailAndPassword(email, password);
          result.fold((failure) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  failure.message ??
                      'Une Erreur est survenue lors de l\'authentification',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }, (_) => null);
        } finally {
          if (mounted) {
            setState(() {
              _isSubmitting = false;
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.isLightMode ? Colors.grey.shade300 : Colors.black87,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 18),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 18),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Mail',
                prefixIcon: Icon(
                  Icons.email,
                  color: context.colorScheme.primary,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mail';
                }
                return null;
              },
              onSaved: (value) {
                _emailController.text = value!;
              },
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: _isObscure
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: context.colorScheme.primary,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe';
                }
                if (value.length < 6) {
                  return 'Le mot de passe doit contenir au moins 6 caractères';
                }
                return null;
              },
              onSaved: (value) {
                _passwordController.text = value!;
              },
            ),
            SizedBox(height: 8),
            !widget.isLogin
                ? TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'confirmer mot de passe',
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: _isObscure
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre mot de passe';
                      }
                      if (value.length < 6) {
                        return 'Le mot de passe doit contenir au moins 6 caractères';
                      }

                      if (value != _passwordController.text) {
                        return 'Les mots de passe ne correspondent pas';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _confirmPasswordController.text = value!;
                    },
                  )
                : SizedBox(),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: _submitForm, // validation du formulaire
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.primary.withValues(
                          alpha: .7,
                        ),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: _isSubmitting
                        ? CircularProgressIndicator(
                            color: context.colorScheme.onPrimary,
                          )
                        : Text(
                            widget.isLogin ? 'Se connecter' : 'S\'inscrire',
                            style: TextStyle(
                              color: context.colorScheme.onPrimary,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.isLogin
                          ? "Vous n'avez pas de compte ? "
                          : " Vous avez déjà un compte ? ",
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    TextSpan(
                      text: widget.isLogin ? "S'inscrire" : "Se connecter",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          widget.isLogin
                              ? context.push('/register')
                              : context.pop();
                        },
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
