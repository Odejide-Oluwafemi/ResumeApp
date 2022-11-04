import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';
import 'package:resume_app/models/contact_model.dart';
import 'package:resume_app/models/user_model.dart';
import 'package:resume_app/widgets/app_text.dart';
import 'package:resume_app/widgets/experience_card.dart';
import 'package:resume_app/widgets/main_text.dart';
import 'package:resume_app/widgets/social_card.dart';
import 'package:resume_app/widgets/tech_stack_card.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

class DetailsPage extends StatelessWidget {
  final UserModel user;
  const DetailsPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget headerWithDivider(String headerText, {double size = 15}) {
      return Container(
        child: Column(
          children: [
            Center(child: MainText(headerText, size: size)),
            Divider(
              color: AppColors.appColor,
              height: 20,
              endIndent: 15,
              indent: 15,
              thickness: 2.5,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  headerWithDivider("OVERVIEW"),
                  SizedBox(
                    child: Card(
                      margin: const EdgeInsets.all(3),
                      elevation: 7,
                      shadowColor: AppColors.appColor,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AppText(
                          user.overview,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  headerWithDivider("SKILLS"),
                  Card(
                    margin: const EdgeInsets.all(3),
                    elevation: 7,
                    shadowColor: AppColors.appColor,
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      height: 180,
                      padding: const EdgeInsets.all(8),
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 15,
                        children: List.generate(
                          user.skills.length,
                          (index) => TechStackCard(
                            user.skills.elementAt(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  headerWithDivider("EXPERIENCES/PROJECTS"),
                  Card(
                    margin: const EdgeInsets.all(3),
                    elevation: 7,
                    shadowColor: AppColors.appColor,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      height: 250,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          user.experiences.length,
                          (index) => ExperienceCard(
                            user.experiences.elementAt(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //WHAT DO I OFFER?
                  const SizedBox(height: 18),
                  headerWithDivider("WHAT DO I ADD TO THE COMPANY?"),
                  SizedBox(
                    child: Card(
                      margin: const EdgeInsets.all(3),
                      elevation: 7,
                      shadowColor: AppColors.appColor,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AppText(
                          user.teamBenefit,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  headerWithDivider("CONTACT ME"),
                  //CONTACT SECTION
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(8),
                    //height: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          user.contacts.length,
                          (index) => SocialCard(
                            user.contacts.elementAt(index),
                            onTap: () {
                              launch(
                                user.contacts.elementAt(index),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //START

            const SizedBox(height: 23),
            //FOOTER
            Container(
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.appColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MainText("RESUME APP", size: 26),
                      MainText("2022, ElyteTechnologies", size: 18),
                      //AppText("Resume App", size: 26, color: Colors.white),
                      //AppText("2022, ElyteTechnologies", color: Colors.white),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launch(ContactModel model) async {
    print("LAUNCH INITIATED OOO!!!!");
    String? scheme;
    if (model.type.toLowerCase().contains('mail')) {
      scheme = 'mailto';
    } else if (model.type.toLowerCase().contains('message') ||
        model.type.toLowerCase().contains('sms')) {
      scheme = 'sms';
    } else if (model.type.toLowerCase().contains('site') ||
        model.type.toLowerCase().contains('web')) {
      scheme = "";
    } else if (model.type.toLowerCase().contains('tel') ||
        (model.type.toLowerCase().contains('phone')) ||
        (model.type.toLowerCase().contains('call'))) {
      scheme = "tel";
    } else {
      scheme = null;
    }

    if (scheme == null) {
      print("ERROR OOO!!!!");
      throw Exception("Invalid Url! Check the Url and try again");
    }

    final link = Uri(
      scheme: scheme,
      path: model.url,
    );

    if (await Launcher.canLaunchUrl(link)) {
      Launcher.launchUrl(
        link,
      );
    } else {
      print("ERROR OOO!!!!");
      throw Exception("An Error Occured! Check the Url and try again");
    }
  }
}
