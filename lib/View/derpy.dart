import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Controller/app_router_controller.dart';
import 'package:flutter/material.dart';

class Derpy extends StatelessWidget {
  const Derpy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouterController.router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorManager.kBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
