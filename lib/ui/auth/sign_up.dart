import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/button.dart';
import 'package:todo/comon/widgets/card.dart';
import 'package:todo/comon/widgets/layout/layout.dart';
import 'package:todo/config/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: LayoutAppBar(
        leading: AppbarLeading(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                context.go('/home');
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5F6FF),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: ArtistaColor.primary,
                    size: 21,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Text(
              'Create',
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Account',
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 41,
            ),
            const Text('Email'),
            const SizedBox(
              height: 8,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ArtistaColor.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ArtistaColor.primary, width: 2),
                ),
                suffixIcon: Icon(
                  Icons.cancel,
                  color: ArtistaColor.primary,
                ),
                hintText: "enter email",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Password'),
            const SizedBox(
              height: 8,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ArtistaColor.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: ArtistaColor.primary, width: 2),
                ),
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: ArtistaColor.primary,
                ),
                hintText: "enter password",
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Button(
              onPressed: () {
                context.go('/home');
              },
              buttonType: ButtonType.elevatedPrimary,
              buttonSize: ButtonSize.md,
              buttonColor: ButtonColor.primary,
              child: Text(
                "Create Account".toUpperCase(),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 58,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(turns: AlwaysStoppedAnimation(90 / 360), child: Text("|")),
                Text("  Or continue with  "),
                RotationTransition(turns: AlwaysStoppedAnimation(90 / 360), child: Text("|")),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ArtistaCard(
                      cardType: ArtistaCardType.primary,
                      borderColor: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      bgColor: const Color(0xFFE5F6FF),
                      width: 72,
                      height: 36,
                      child: Center(
                        child: Image.asset('assets/images/google.png'),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ArtistaCard(
                      cardType: ArtistaCardType.primary,
                      borderColor: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      bgColor: const Color(0xFFE5F6FF),
                      width: 72,
                      height: 36,
                      child: Center(
                        child: Image.asset('assets/images/facebook.png'),
                      ),
                    ),
                  ),
                ].withSpaceBetween(width: 16),
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account ? "),
                Text(
                  "Login",
                  style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: ArtistaColor.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
