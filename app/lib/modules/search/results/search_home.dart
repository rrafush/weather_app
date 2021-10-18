import 'package:flutter/material.dart';
import 'package:weather_app/theme/app_colors.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Image(image: AssetImage('assets/welcome.png')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Text(
            'Write the name of a city to know the weather in that city!',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.white.withOpacity(0.5)),
          ),
        ),
      ],
    );
  }
}
