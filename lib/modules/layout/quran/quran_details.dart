import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/quran/widgets/quran_details_background.dart';

import '../../../model/sura_data_model.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SuraDataModel suraDataModel =
        ModalRoute.of(context)?.settings.arguments as SuraDataModel;

    if (verses.isEmpty) readDataFromFile(suraDataModel.suraNumber);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(suraDataModel.suraNameEn)),

      body: Stack(
        children: [
          QuranDetailsBackground(suraDataModel: suraDataModel),
          Padding(
            padding: EdgeInsets.only(top: 80, bottom: 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.builder(
                itemCount: verses.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      '[${index + 1}] ${verses[index]}',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.gold,
                        height: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> verses = [];

  Future<void> readDataFromFile(int suraNumber) async {
    String content = await rootBundle.loadString(
      "assets/files/Suras/$suraNumber.txt",
    );
    verses = content.split('\n');
    setState(() {});
  }
}
