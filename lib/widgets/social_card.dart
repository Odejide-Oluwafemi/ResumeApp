import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';
import 'package:resume_app/models/contact_model.dart';
import 'package:resume_app/widgets/main_text.dart';

/// The Widget for users' contact handles
class SocialCard extends StatelessWidget {
  /// The [ContactModel] containing the contact details. See [ContactModel].
  final ContactModel model;

  /// Callback to lauch the url and contact the contact, lol.
  final Function onTap;

  const SocialCard(this.model, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: AssetImage(model.imagePath!),
                  fit: BoxFit.cover,
                ),
              ),
              child: model.imagePath == null
                  ? Icon(
                      Icons.add,
                      color: Theme.of(context).textTheme.labelLarge!.color,
                      size: 22,
                    )
                  : Container(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 3, bottom: 3),
              height: 1.75,
              width: 80,
              color: AppColors.appColor,
            ),
            MainText(
              model.name,
              size: 13,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
