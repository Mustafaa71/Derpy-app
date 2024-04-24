import 'dart:developer';

import 'package:derpy/Model/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends StateNotifier<AsyncValue> {
  final supabase = Supabase.instance.client;

  static final authControllerProvider = StateNotifierProvider.autoDispose<AuthController, AsyncValue>((ref) {
    return AuthController();
  });

  AuthController() : super(const AsyncLoading());

  static void clearAndDisposeControllers(
    List<TextEditingController> controllers,
  ) {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  /// <---------- Sign Up Controller Section ----------> .

  String? getUserId() {
    return supabase.auth.currentSession?.user.id;
  }

  String getName() {
    final name = supabase.auth.currentUser?.userMetadata;
    return name?['data']['name'];
  }

  String getUserName() {
    final userMetadata = supabase.auth.currentUser?.userMetadata;
    return userMetadata != null ? userMetadata['data']['userName'] : 'Gg';
  }

  Future<void> insertDemoData() async {
    final uuid = getUserId();
    final name = getName();
    final userName = getUserName();
    await supabase.from('user').insert({
      'uuid': uuid,
      'name': name,
      'user_name': '@$userName',
    });
  }

  Future<void> createUserAccount({
    required Registration signUp,
  }) async {
    try {
      final AuthResponse response = await supabase.auth.signUp(email: signUp.email, password: signUp.password, data: {
        'data': {
          'name': signUp.name,
          'userName': '@${signUp.userName}',
        },
      });

      state = AsyncData(response);

      log('successful');
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      print(error);
    }
  }

  Future<void> handleSignUp({
    required Registration user,
    required VoidCallback onSuccess,
  }) async {
    try {
      await createUserAccount(
        signUp: Registration(user.name, user.userName, user.email, user.password),
      );
      onSuccess();
      insertDemoData();
    } catch (e) {
      print(e);
    }
  }

  /// <---------- Sign In Controller Section ----------> .

  Future signInWithEmail({required String email, required String password}) async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      state = AsyncData(response);
      print('successful');
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      print('Error signing in: $error');
      rethrow;
    }
  }

  Future<void> handleSignIn({
    required String emailController,
    required String passwordController,
    required VoidCallback onSuccess,
  }) async {
    try {
      await signInWithEmail(email: emailController, password: passwordController);
      onSuccess();
    } catch (e) {
      print('Sign-in failed: $e');
    }
  }

  /// <---------- Sign out Controller Section ----------> .

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
