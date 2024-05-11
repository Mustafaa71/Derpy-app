import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/View/Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Derpy extends HookConsumerWidget {
  const Derpy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;

    final Widget widgetRefrense = user != null ? const MainPage() : const MainPage();
    return MaterialApp(
      home: widgetRefrense,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorManager.kBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
