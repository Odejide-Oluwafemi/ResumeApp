import 'package:flutter/material.dart';
import 'package:resume_app/models/contact_model.dart';
import 'package:resume_app/models/experience_model.dart';
import 'package:resume_app/models/skill_model.dart';
import 'package:resume_app/models/user_model.dart';
import 'package:resume_app/pages/details_page.dart';
import 'package:resume_app/pages/overview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel user = UserModel(
    image: Image.asset("images/profile.jpg"),
    firstName: "Oluwafemi",
    lastName: "Odejide",
    jobTitle: "Software Developer",
    overview:
        "A Software Enthusiast with Strong passion for Video Game and Mobile Application Development. He has been in the Software field for more than 4 years. He is a Team Player with great communication skills. Outside of the Tech space, he is a Guitarist and during his spare time, he engages in 3D modelling (blender), Photo Editing/Image Manipulation (GIMP) and Music Production (FL Studio).",
    teamBenefit:
        "A Software Enthusiast with Strong passion for Video Game and Mobile Application Development. He has been in the Software field for more than 4 years. He is a Team Player with great communication skills. Outside of the Tech space, he is a Guitarist and during his spare time, he engages in 3D modelling (blender), Photo Editing/Image Manipulation (GIMP) and Music Production (FL Studio).",
    contacts: [
      ContactModel(
        name: "FACEBOOK",
        url: "https://www.facebook.com/EliJah007",
        type: "web",
        image: Image.asset("images/fb.png"),
      ),
      ContactModel(
        name: "GITHUB",
        url: "https://www.github.com/Odejide-Oluwafemi",
        type: "web",
        image: Image.asset("images/github.png"),
      ),
      ContactModel(
        name: "TWITTER",
        url: "https://www.twitter.com/Eli_Jah_007",
        type: "web",
        image: Image.asset("images/twitter.png"),
      ),
      ContactModel(
        name: "SMS",
        url: "+2348093486840",
        type: "sms",
        image: Image.asset("images/sms.png"),
      ),
      ContactModel(
        name: "CALL",
        url: "+2348093486840",
        type: "tel",
        image: Image.asset("images/phonecall.png"),
      ),
      ContactModel(
        name: "WHATSAPP",
        url: "+2348093486840",
        type: "tel",
        image: Image.asset("images/whatsapp.png"),
      ),
      ContactModel(
        name: "GMAIL",
        url: "oluwatosinodejide121@gmail.com",
        type: "mail",
        image: Image.asset("images/gmail.png"),
      ),
    ],
    experiences: [
      ExperienceModel(
        image: Image.asset("images/game1.png"),
        description:
            "A 2D Open_World Space game where players battle with Spaceships to be the last Piloting Pilot (features a Fast-Paced, Intensive Combat System and a soon to be implemented Multiplayer Feature...hopefully). It was built with the Godot Game Engine",
        projectTitle: "Space Royale",
      ),
      ExperienceModel(
        image: Image.asset("images/mobile.png"),
        description:
            "A Simple app that displays a list of dishes based on the users' search input (features Authentication and API calls and responses)",
        projectTitle: "Dish Search App",
      ),
      ExperienceModel(
        image: Image.asset("images/mobile.png"),
        description:
            "A Simple app gets the weather condition of the users' search input (features API calls and responses)",
        projectTitle: "Weather Checker App",
      ),
      ExperienceModel(
        image: Image.asset("images/game1.png"),
        description: "A Flappy Bird clone made with Unity.",
        projectTitle: "Fluffy Jump",
      ),
      ExperienceModel(
        image: Image.asset("images/game1.png"),
        description:
            "A 2D Side Scrolling Game with Unity. All that is required of the player is to jump to avoid oncoming enemies from both sides. Easy right? Wrong!",
        projectTitle: "Monster Jump",
      ),
      ExperienceModel(
        image: Image.asset("images/game1.png"),
        description:
            "A 2D Side Scrolling Game made with Godot. The player is required to control his ship to avoid oncoming asteroids or shoot to destroy them (features Persistence Storage).",
        projectTitle: "Asteroid Dodge",
      ),
    ],
    skills: [
      SkillModel(
        image: Image.asset("images/flutter.png"),
        name: "Flutter",
      ),
      SkillModel(
        image: Image.asset("images/dart.png"),
        name: "Dart",
      ),
      SkillModel(
        image: Image.asset("images/html.png"),
        name: "HTML",
      ),
      SkillModel(
        image: Image.asset("images/css.png"),
        name: "CSS",
      ),
      SkillModel(
        image: Image.asset("images/javascript.png"),
        name: "JavaScript",
      ),
      SkillModel(
        image: Image.asset("images/cplusplus.png"),
        name: "C++",
      ),
      SkillModel(
        image: Image.asset("images/godot.png"),
        name: "GODOT",
      ),
      SkillModel(
        image: Image.asset("images/unity.png"),
        name: "Unity",
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? Row(
            children: [
              OverviewPage(
                firstName: user.firstName,
                lastName: user.lastName,
                jobTitle: user.jobTitle,
                profile: user.image,
              ),
              SizedBox(width: 3),
              Expanded(
                child: DetailsPage(user),
              ),
            ],
          )
        : PageView(
            scrollDirection: Axis.vertical,
            children: [
              OverviewPage(
                firstName: user.firstName,
                lastName: user.lastName,
                jobTitle: user.jobTitle,
                profile: user.image,
              ),
              DetailsPage(user),
            ],
          );
  }
}
