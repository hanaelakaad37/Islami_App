import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../model/sura_data_model.dart';

class SuraItem extends StatefulWidget {
  final SuraDataModel suraDataModel;
  final void Function()? onTap;

  const SuraItem({super.key, required this.suraDataModel, required this.onTap});

  @override
  State<SuraItem> createState() => _SuraItemState();
}

class _SuraItemState extends State<SuraItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(image: Assets.images.vector.provider()),
            ),

            child: Text(
              "${widget.suraDataModel.suraNumber}",
              style: textTheme.bodyLarge,
            ),
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Text(widget.suraDataModel.suraNameEn, style: textTheme.bodyLarge),
              Text(
                "${widget.suraDataModel.versesCount} Verses",
                style: textTheme.bodyMedium?.copyWith(color: AppColors.white),
              ),
            ],
          ),
          Spacer(),
          Text(widget.suraDataModel.suraNameAr, style: textTheme.bodyLarge),
        ],
      ),
    );
  }
}
