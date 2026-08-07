import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/hadith_data_model.dart';
import 'package:islami/modules/layout/hadith/hadith_card.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/theme/app_colors.dart';

class Hadith extends StatefulWidget {
  const Hadith({super.key});


  @override
  State<Hadith> createState() => _HadithState();

}

class _HadithState extends State<Hadith> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readHadithData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.hadithBg.image(fit: BoxFit.cover),
        ),
        Container(color: AppColors.dark.withValues(alpha: 0.7)),

        SafeArea(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Assets.images.islami.image(width: 291, height: 171),
              ),

              CarouselSlider(
                  items:
                  _hadithData.map((data) => HadithCard(hadithDataModel: data))
                      .toList(),

                  options: CarouselOptions(
                    height: mediaQuery.size.height * 0.6,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  )
              )
            ],
          ),
        ))


      ],
    );
  }


  final List<HadithDataModel> _hadithData = [];

  Future<void> _readHadithData() async {
    for (int i = 1; i <= 50; i++) {
      String content = await rootBundle.loadString(
          "assets/files/Hadeeth/h$i.txt");
      final titleLenght = content.indexOf("\n");
      final titleContent = content.substring(0, titleLenght + 1);
      final hadithContent = content.substring(titleLenght);

      final hadithDataModel =
      HadithDataModel(hadithContent: hadithContent, hadithTitle: titleContent);

      _hadithData.add(hadithDataModel);
    }
    setState(() {});
  }
}

