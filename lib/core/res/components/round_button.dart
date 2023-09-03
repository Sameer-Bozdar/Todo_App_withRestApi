

import 'package:flutter/material.dart';

import '../colors.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({super.key,
    required this.title,
    this.loading = false,
    required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child:loading ? const CircularProgressIndicator(
          strokeWidth: 3,
          color: Colors.white,


        ) : Text(title,style: const TextStyle(color: AppColors.whiteColor),)),

      ),
    );
  }
}
