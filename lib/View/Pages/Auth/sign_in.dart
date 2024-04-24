import 'dart:developer';

import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/View/Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInController = ref.watch(AuthController.authControllerProvider.notifier);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Future.microtask(() async {
                  try {
                    await signInController.signInWithEmail(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => const MainPage())));
                  } catch (e) {
                    log(e.toString());
                  }
                  print('Sign In button pressed');
                });
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
