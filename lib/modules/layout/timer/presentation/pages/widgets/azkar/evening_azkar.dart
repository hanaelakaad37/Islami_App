import 'package:flutter/material.dart';

import 'azkar_list_view.dart';

class EveningAzkar extends StatelessWidget {
  const EveningAzkar({super.key});

  @override
  Widget build(BuildContext context) {
    return const AzkarListView(
      category: 'أذكار المساء',
      title: 'Evening Azkar',
    );
  }
}
