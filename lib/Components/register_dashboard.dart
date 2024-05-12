import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/View/Pages/Auth/sign_in.dart';
import 'package:derpy/View/Pages/Auth/sign_up.dart';
import 'package:derpy/View/Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterDashboard extends HookConsumerWidget {
  const RegisterDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Text(
              'Register to have access to use Derpy features',
              style: TextStyleManager(
                kColor: Colors.white,
                kFontSize: 25.0,
                kFontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: ColorManager.kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12.0),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyleManager(
                      kColor: Colors.white,
                      kFontSize: 15.0,
                      kFontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp())),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: ColorManager.kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Center(
                  child: Text(
                    'Sign up ',
                    style: TextStyleManager(
                      kColor: Colors.white,
                      kFontSize: 15.0,
                      kFontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await authController.googleRegistration();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const MainPage()),
                      (Route route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      color: ColorManager.kBackgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.asset('assets/google.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
