import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkup/domain/constants/app_colors.dart';
import 'package:linkup/domain/constants/cubits/theme_cubit.dart';
import 'package:linkup/repository/screens/login/login_screen.dart';
import 'package:linkup/repository/screens/widgets/ui_helper.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.scaffolddark
          : AppColors.scaffoldlight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => context.read<ThemeCubit>().toggletheme(),
            icon: const Icon(CupertinoIcons.moon_stars),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Lottie.asset("assets/animation/onboarding.json", height: 200),

            // UiHelper.customImage(imgUrl: "onboarding_1.png"),
            SizedBox(height: 30),
            _buildOnboardingText("Stay connected,  ", context),
            _buildOnboardingText("chat with friends,", context),
            _buildOnboardingText("share moments instantly.", context),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UiHelper.customButton(
        buttonName: "Let's go!",
        callback: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        ),
      ),
    );
  }

  Widget _buildOnboardingText(String text, BuildContext context) {
    return UiHelper.customText(
      text: text,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      context: context,
    );
  }
}
