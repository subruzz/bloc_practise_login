import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/login/bloc/auth_bloc.dart';
import 'package:flutter_bloc_sample/login/home.dart';
import 'package:flutter_bloc_sample/login/widgets/gradient_button.dart';
import 'package:flutter_bloc_sample/login/widgets/login_button.dart';
import 'package:flutter_bloc_sample/login/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthFailed) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.err)));
      } else if (state is AuthSuccess) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      }
    }, builder: (context, state) {
      {
        return state is AuthLoading
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/signin_balls.png'),
                        const Text(
                          'Sign in.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                        const SizedBox(height: 50),
                        const SocialButton(
                            label: 'Continue with Google'),
                        const SizedBox(height: 20),
                        const SocialButton(
                          label: 'Continue with Facebook',
                          horizontalPadding: 90,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'or',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 15),
                        LoginField(
                          hintText: 'Email',
                          controller: emailController,
                        ),
                        const SizedBox(height: 15),
                        LoginField(
                          hintText: 'Password',
                          controller: passwordController,
                        ),
                        const SizedBox(height: 20),
                        GradientButton(
                          onLogin: () {
                            context.read<AuthBloc>().add(LoginClickEvent(
                                email: emailController.text.trim(),
                                password: passwordController.text));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }
    });
  }
}
