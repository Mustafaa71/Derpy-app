import 'dart:async';
import 'dart:developer';

import 'package:derpy/Model/registration.dart';
import 'package:derpy/Model/user_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends StateNotifier<User?> {
  final supabase = Supabase.instance.client;

  static final authControllerProvider = StateNotifierProvider.autoDispose<AuthController, User?>((ref) {
    return AuthController(ref);
  });

  AuthController(Ref ref) : super(null);

  static void clearAndDisposeControllers(
    List<TextEditingController> controllers,
  ) {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  /// <Fetching User Information Controller>

  Future<UserInformation> fetchUserName(String userId) async {
    try {
      final response = await supabase.from('user').select('name , user_name').eq('id', userId);
      if (response.isNotEmpty) {
        final name = response.first['name'];
        final userName = response.first['user_name'];
        log('This is from authController [name]:$name');
        log('This is from authController [name]:$userName');
        return UserInformation(name: name, userName: userName);
      } else {
        print('No user found with id $userId');
        return UserInformation(name: null, userName: null);
      }
    } catch (e) {
      print('Exception fetching user name: $e');
      return UserInformation(name: null, userName: null);
    }
  }

  /// <---------- Sign Up Controller Section ----------> .

  String? getUserId() {
    return supabase.auth.currentSession?.user.id;
  }

  String? getName() {
    final userMetadata = supabase.auth.currentUser?.userMetadata;
    if (userMetadata != null && userMetadata.containsKey('data')) {
      return userMetadata['data']['name'];
    }

    return null;
  }

  String getUserName() {
    final userMetadata = supabase.auth.currentUser?.userMetadata;
    return userMetadata != null ? userMetadata['data']['userName'] : '@Derpy';
  }

  Future<void> getUserNameFromGoogleApi(String? userId) async {
    final currentUser = supabase.auth.currentUser?.userMetadata;
    final getUserName = currentUser != null ? currentUser['full_name'] ?? '' : '';

    try {
      await supabase.from('user').insert({
        'id': userId,
        'name': getUserName,
        'user_name': '@$userId',
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> insertDemoData() async {
    final uuid = getUserId();
    final name = getName();
    final userName = getUserName();
    await supabase.from('user').insert({
      'id': uuid,
      'name': name,
      'user_name': '@$userName',
    });
  }

  Future<void> createUserAccount({
    required Registration signUp,
  }) async {
    try {
      final AuthResponse response =
          await supabase.auth.signUp(email: signUp.email, password: signUp.password, data: {});

      state = response.user;

      log('successful');
    } catch (error) {
      rethrow;
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

      state = response.user;
      print('successful');
    } catch (error) {
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

  /// <---------- Google sign-in Controller Section ----------> .

  Future<void> googleRegistration() async {
    const webClientId = '497698355565-41mnh8g4j4sr72bj8a6v41hv5lsfbiaf.apps.googleusercontent.com';

    const iosClientId = '497698355565-4prgkkbvra2ndgjga1n7353dqi2jji7b.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final userId = supabase.auth.currentUser?.id;

    if (userId == null) {
      throw 'No User ID found.';
    }
    getUserNameFromGoogleApi(userId);
  }

  /// <---------- Sign out Controller Section ----------> .

  Future<void> signOut() async {
    await supabase.auth.signOut();
    state = null;
  }
}
