import 'package:islami/core/gen/assets.gen.dart';

class OnboardingModel {
  final AssetGenImage img;
  final String title1;
  final String title2;

  OnboardingModel({
    required this.img,
    required this.title1,
    required this.title2,
  });
}

List<OnboardingModel> pages = [
  OnboardingModel(
    img: Assets.images.frame31,
    title1: "Welcome To Islami App",
    title2: "",
  ),
  OnboardingModel(
    img: Assets.images.kabba,
    title1: "Welcome To Islami",
    title2: "We Are Very Excited To Have You In Our Community",
  ),
  OnboardingModel(
    img: Assets.images.reading,
    title1: "Reading the Quran",
    title2: "Read, and your Lord is the Most Generous",
  ),
  OnboardingModel(
    img: Assets.images.bearish,
    title1: "Bearish",
    title2: "Praise the name of your Lord, the Most High",
  ),
  OnboardingModel(
    img: Assets.images.radio,
    title1: "Holy Quran Radio",
    title2:
        "You can listen to the Holy Quran Radio through the application for free and easily",
  ),
];
