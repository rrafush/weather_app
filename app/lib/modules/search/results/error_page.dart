import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/theme/app_colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Lottie.asset('assets/error-animation.json'),
        Padding(
          padding: const EdgeInsets.all(30),
          child:  Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    'Something went wrong...',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(error.replaceAll('Exception:', '')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
