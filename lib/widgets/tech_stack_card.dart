import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';
import 'package:resume_app/models/skill_model.dart';
import 'package:resume_app/widgets/app_text.dart';

/// The Widget for users' skillsets
class TechStackCard extends StatelessWidget {
  /// The [SkillModel] containing the required details. See [SkillModel] class
  final SkillModel model;

  const TechStackCard(this.model, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(model.imagePath),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Divider(
            color: AppColors.appColor,
            thickness: 2.7,
            height: 12,
            indent: 15,
            endIndent: 15,
          ),
          AppText(
            model.name,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
