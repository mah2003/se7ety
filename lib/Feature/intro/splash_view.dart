import 'package:flutter/material.dart';
import 'package:se7ety/Core/Functions/Navigation.dart';
import 'package:se7ety/Core/service/local_storag/local_storage.dart';
import 'package:se7ety/Feature/intro/onboarding.dart/onboarding_view.dart';
import 'package:se7ety/Feature/intro/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // todo: 1)
      // Todo: check this user is a doctor or patient
      // todo: using firebase firestore
      // todo: using cacheing
      bool isOnbordingShown =
          AppLocalStorage.getcashedData(key: AppLocalStorage.onBoarding);
      if (isOnbordingShown == true) {
        pushReplacement(context, const WelcomeView());
      } else
        pushReplacement(context, const OnboardingView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'Assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
