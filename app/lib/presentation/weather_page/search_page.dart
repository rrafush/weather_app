import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_app/presentation/search_controller.dart';
import 'package:weather_app/presentation/theme/app_colors.dart';
import 'package:weather_app/presentation/weather_page/results/error_page.dart';
import 'package:weather_app/presentation/weather_page/results/result_page.dart';
import 'package:weather_app/presentation/weather_page/results/search_home.dart';

final controller = SearchController();

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: AppColors.bgGradient,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          cursorColor: AppColors.lightPurple,
                          controller: textController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              fillColor: AppColors.lightPurple,
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.white),
                              border: InputBorder.none,
                              labelText: 'Search...',
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    textController.clear();
                                    controller.clearSearch();
                                  })),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.primary)),
                      onPressed: () async {
                        controller.clearSearch();
                        await controller.getWeather(textController.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 20),
                        child: Text('Go'),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: controller.uiModel.hasContent &&
                          !controller.isLoading &&
                          controller.errorFeedback == null
                      ? SearchHome()
                      : controller.isLoading
                          ? Container(
                              height: MediaQuery.of(context).size.height - 150,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: AppColors.white,
                                      )),
                                ],
                              ),
                            )
                          : controller.uiModel.hasContent
                              ? ResultPage(
                                  city: controller.uiModel.city,
                                  country: controller.uiModel.country,
                                  currentTemp: controller.uiModel.currentTemp,
                                  maxTemp: controller.uiModel.maxTemp,
                                  minTemp: controller.uiModel.minTemp,
                                  weatherState:
                                      controller.uiModel.weatherState,
                                  imageAsset: controller.imageAsset!,
                                  week: controller.uiModel.allDays,
                                  onClear: () {
                                    textController.clear();
                                    controller.clearSearch();
                                  },
                                )
                              : controller.errorFeedback != null
                                  ? ErrorPage(error: controller.errorFeedback!)
                                  : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
