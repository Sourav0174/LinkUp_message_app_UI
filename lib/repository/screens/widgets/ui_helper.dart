import 'package:flutter/material.dart';
import 'package:linkup/domain/constants/app_colors.dart';

class UiHelper {
  static customImage({required String imgUrl}) {
    return Image.asset(
      "assets/images/$imgUrl",
      fit: BoxFit.cover,
    );
  }

  static customText({
    required String text,
    required,
    required double fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    Color? color,
    required BuildContext context,
  }) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily ?? "regular",
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ??
              (Theme.of(context).brightness == Brightness.dark
                  ? AppColors.textdarkmode
                  : AppColors.textlightmode)),
    );
  }

  static customButton(
      {required String buttonName,
      required VoidCallback callback,
      Color? buttonColor}) {
    return SizedBox(
      height: 52,
      width: 350,
      child: ElevatedButton(
          child: Text(
            buttonName,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "bold"),
          ),
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonlightmode,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )),
    );
  }

  static Widget customTextField({
    required TextEditingController controller,
    required String text,
    required TextInputType textInput,
    required BuildContext context,
    IconData? iconData, // Made optional by using '?'
  }) {
    return Container(
      height: 45,
      width: 350,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.containerdarkmode
            : AppColors.containerlightmode,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          controller: controller,
          keyboardType: textInput,
          decoration: InputDecoration(
            hintText: text,
            prefixIcon: iconData != null
                ? Icon(iconData)
                : null, // Show only if iconData is provided
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.hintdarkmode
                  : AppColors.hintlightmode,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
