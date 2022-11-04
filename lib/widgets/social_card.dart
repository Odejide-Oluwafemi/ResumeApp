import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';
import 'package:resume_app/models/contact_model.dart';
import 'package:resume_app/widgets/app_text.dart';

class SocialCard extends StatelessWidget {
  final ContactModel model;
  final Function onTap;
  const SocialCard(this.model, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tapped from Class");
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.appColor,
              ),
              child: model.image,
            ),
            Container(
              margin: const EdgeInsets.only(top: 3, bottom: 3),
              height: 1.75,
              width: 80,
              color: AppColors.appColor,
            ),
            AppText(model.name),
          ],
        ),
      ),
    );
  }
}
