import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/View/Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Derpy extends HookConsumerWidget {
  const Derpy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Widget widgetRefrense = MainPage();

    return MaterialApp(
      home: widgetRefrense,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorManager.kBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
