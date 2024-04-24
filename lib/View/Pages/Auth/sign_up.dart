import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Model/registration.dart';
import 'package:derpy/View/Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUp extends HookConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpController = ref.watch(AuthController.authControllerProvider.notifier);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final userNameController = TextEditingController();
    final nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: userNameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                signUpController.handleSignUp(
                  user: Registration(
                    nameController.text,
                    userNameController.text,
                    emailController.text,
                    passwordController.text,
                  ),
                  onSuccess: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const MainPage()));
                  },
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
