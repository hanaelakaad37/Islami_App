import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../../../../../core/di/app_di.dart';
import '../../../manager/azkar_bloc.dart';
import '../../../manager/azkar_event.dart';
import '../../../manager/azkar_state.dart';
import 'azkar_card.dart';

class AzkarListView extends StatelessWidget {
  final String category;
  final String title;

  const AzkarListView({super.key, required this.category, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AzkarBloc>()..add(GetAzkarEvent(category)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          centerTitle: true,
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: BlocBuilder<AzkarBloc, AzkarState>(
            builder: (context, state) {
              if (state is AzkarLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.gold),
                );
              }

              if (state is AzkarFailure) {
                return Center(child: Text(state.message));
              }

              if (state is AzkarSuccess) {
                if (state.azkar.isEmpty) {
                  return const Center(child: Text('No Azkar found'));
                }

                return ListView.separated(
                  itemCount: state.azkar.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) =>
                      AzkarCard(zekr: state.azkar[index]),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
