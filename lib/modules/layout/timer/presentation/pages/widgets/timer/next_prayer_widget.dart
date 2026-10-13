import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../../core/data_formatter/data_formatter.dart';
import '../../../../../../../core/theme/app_colors.dart';

class NextPrayerWidget extends StatefulWidget {
  final Map<String, dynamic> prayerTimesMap;

  const NextPrayerWidget({super.key, required this.prayerTimesMap});

  @override
  State<NextPrayerWidget> createState() => _NextPrayerWidgetState();
}

class _NextPrayerWidgetState extends State<NextPrayerWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    if (duration.isNegative) {
      return '00:00:00';
    }

    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final nextPray = DataFormatter.getNextPray(widget.prayerTimesMap);

    final nextPrayName = nextPray?.key ?? '';
    final remainingTime = nextPray?.value ?? Duration.zero;

    return Center(
      child: Text(
        'Next Pray : $nextPrayName '
        '(${_formatDuration(remainingTime)})',
        style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.dark),
      ),
    );
  }
}
