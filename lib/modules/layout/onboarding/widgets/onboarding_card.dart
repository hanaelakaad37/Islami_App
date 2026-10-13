import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../../core/app_routes/app_routes_name.dart';
import '../../../../core/services/shared_preferences.dart';
import '../onboarding_data.dart';

class OnboardingCard extends StatefulWidget {
  const OnboardingCard({super.key});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard> {
  final PageController controller = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    pages[index].img.image(),
                    Text(
                      pages[index].title1,
                      style: TextStyle(
                        fontFamily: "JannaLT",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      pages[index].title2,
                      style: TextStyle(
                        fontFamily: "JannaLT",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.gold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Back
              TextButton(
                style: TextButton.styleFrom(foregroundColor: AppColors.gold),

                onPressed: currentPage == 0
                    ? null
                    : () {
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                child: const Text("Back"),
              ),

              /// Dots
              Row(
                children: List.generate(
                  pages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),

                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? AppColors.gold
                          : AppColors.gray,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              /// Next / Finish
              TextButton(
                style: TextButton.styleFrom(foregroundColor: AppColors.gold),
                onPressed: () async {
                  await SharedPrefService.saveOnBoarding();
                  if (currentPage == pages.length - 1) {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutesName.layout,
                    );
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(
                  currentPage == pages.length - 1 ? "Finish" : "Next",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
