import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkup/domain/constants/app_colors.dart';
import 'package:linkup/domain/constants/cubits/theme_cubit.dart';
import 'package:linkup/repository/screens/bottomnav/bottom_navigation_screen.dart';
import 'package:linkup/repository/screens/widgets/ui_helper.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.scaffolddark
          : AppColors.scaffoldlight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.back),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // UiHelper.customImage(
            //   imgUrl: Theme.of(context).brightness == Brightness.dark
            //       ? "darkprofile.png"
            //       : "lightprofile.png",
            // ),
            SizedBox(
              height: 100,
            ),
            Lottie.asset("assets/animation/profile.json", height: 150),
            const SizedBox(height: 50),
            UiHelper.customTextField(
              controller: _firstNameController,
              text: "First name",
              textInput: TextInputType.name,
              context: context,
            ),
            const SizedBox(height: 10),
            UiHelper.customTextField(
              controller: _lastNameController,
              text: "Last name",
              textInput: TextInputType.name,
              context: context,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UiHelper.customButton(
        buttonName: "Save",
        callback: () {
          if (_firstNameController.text.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationScreen(
                  userName: _firstNameController.text,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please enter your name")),
            );
          }
        },
      ),
    );
  }
}
