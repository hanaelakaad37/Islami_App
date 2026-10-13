import 'package:flutter/material.dart';

import 'azkar_list_view.dart';

class MorningAzkar extends StatelessWidget {
  const MorningAzkar({super.key});

  @override
  Widget build(BuildContext context) {
    return const AzkarListView(
      category: 'أذكار الصباح',
      title: 'Morning Azkar',
    );
  }
}
