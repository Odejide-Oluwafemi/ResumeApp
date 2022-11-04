import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';
import 'package:resume_app/models/skill_model.dart';
import 'package:resume_app/widgets/app_text.dart';

class TechStackCard extends StatelessWidget {
  final SkillModel model;

  const TechStackCard(this.model, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 500,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceEvenly,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage(model.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          /* CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(model.imagePath,),

          ), */
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
            size: 12,
          ),
        ],
      ),
    );
  }
}
