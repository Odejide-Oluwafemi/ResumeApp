import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';
import 'package:resume_app/models/experience_model.dart';
import 'package:resume_app/widgets/app_text.dart';
import 'package:resume_app/widgets/main_text.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceModel model;

  ExperienceCard(this.model, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
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
              /* CircleAvatar(
                radius: 26,
                backgroundImage: model.image.image,
                child: model.image == null ? Icon(Icons.add) : Container(),
              ), */
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.projectTitle,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelLarge!.color,
                      fontFamily:
                          Theme.of(context).textTheme.labelLarge!.fontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 2,
                    color: AppColors.appColor,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Flexible(
            child: SingleChildScrollView(
              child: AppText(
                model.description,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
SingleChildScrollView(
            child: AppText(
              "A Software Enthusiast with Strong passion for Video Game and Mobile Application Development. He has been in the Software field for more than 4 years. He is a Team Player with great communication skills. Outside of the Tech space, he is a Guitarist and during his spare time, he engages in 3D modelling (blender), Photo Editing/Image Manipulation (GIMP) and Music Production (FL Studio).",
            ),
          ),
*/
