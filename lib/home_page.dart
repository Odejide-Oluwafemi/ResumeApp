import 'package:flutter/material.dart';
import 'package:resume_app/misc/config.dart';
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
  // Creates a new User
  UserModel user = const UserModel(
    imagePath: "images/profile.jpg",
    firstName: "Oluwafemi",
    lastName: "Odejide",
    jobTitle: "Software Developer",
    overview:
        "A Software Enthusiast with Strong passion for Video Game and Mobile Application Development. He has been in the Software field for more than 4 years. He is a Team Player with great communication skills. Outside of the Tech space, he is a Guitarist and during his spare time, he engages in 3D modelling (blender), Photo Editing/Image Manipulation (GIMP) and Music Production (FL Studio).",
    teamBenefit:
        "I am Result Oriented, which means I seek to get the job done on Schedule and above minimal requirements. I am not Perfect but I am always Learning. Like I mentioned in the Overview Section, I've been in the Programming Field for 4+ years, most of which were dedicated to Game Development and Programming, and have tackled so many challenges and bugs. If you need an 'outta-the-box' thinker (with a touch of weirdness), I'm your guy.",
    contacts: [
      ContactModel(
        name: "FACEBOOK",
        url: "https://www.facebook.com/EliJah0O7",
        type: "web",
        imagePath: "images/fb.png",
      ),
      ContactModel(
        name: "GITHUB",
        url: "https://www.github.com/Odejide-Oluwafemi",
        type: "web",
        imagePath: "images/github.png",
      ),
      ContactModel(
        name: "TWITTER",
        url: "https://www.twitter.com/Eli_Jah_007",
        type: "web",
        imagePath: "images/twitter.png",
      ),
      ContactModel(
        name: "SMS",
        url: "+2348093486840",
        type: "sms",
        imagePath: "images/sms.png",
      ),
      ContactModel(
        name: "CALL",
        url: "+2348093486840",
        type: "tel",
        imagePath: "images/phonecall.png",
      ),
      ContactModel(
        name: "WHATSAPP",
        url: "+2348093486840",
        type: "tel",
        imagePath: "images/whatsapp.png",
      ),
      ContactModel(
        name: "GMAIL",
        url: "oluwatosinodejide121@gmail.com",
        type: "mail",
        imagePath: "images/gmail.png",
      ),
    ],
    experiences: [
      ExperienceModel(
        imagePath: "images/game1.png",
        description:
            "A 2D Open_World Space game where players battle with Spaceships to be the last Piloting Pilot (features a Fast-Paced, Intensive Combat System and a soon to be implemented Multiplayer Feature...hopefully). It was built with the Godot Game Engine",
        projectTitle: "Space Royale",
      ),
      ExperienceModel(
        imagePath: "images/mobile.png",
        description:
            "A Simple app that displays a list of dishes based on the users' search input (features Authentication and API calls and responses)",
        projectTitle: "Dish Search App",
      ),
      ExperienceModel(
        imagePath: "images/mobile.png",
        description:
            "A Simple app gets the weather condition of the users' search input (features API calls and responses)",
        projectTitle: "Weather Checker App",
      ),
      ExperienceModel(
        imagePath: "images/game1.png",
        description:
            "A Flappy Bird clone made with Unity...that's basically it I guess",
        projectTitle: "Fluffy Jump",
      ),
      ExperienceModel(
        imagePath: "images/game1.png",
        description:
            "A 2D Side Scrolling Game with Unity. All that is required of the player is to jump to avoid oncoming enemies from both sides. Easy right? Wrong!",
        projectTitle: "Monster Jump",
      ),
      ExperienceModel(
        imagePath: "images/game1.png",
        description:
            "A 2D Side Scrolling Game made with Godot. The player is required to control his ship to avoid oncoming asteroids or shoot to destroy them (features Persistence Storage).",
        projectTitle: "Asteroid Dodge",
      ),
    ],
    skills: [
      SkillModel(
        imagePath: "images/flutter.png",
        name: "Flutter",
      ),
      SkillModel(
        imagePath: "images/dart.png",
        name: "Dart",
      ),
      SkillModel(
        imagePath: "images/html.png",
        name: "HTML",
      ),
      SkillModel(
        imagePath: "images/css.png",
        name: "CSS",
      ),
      SkillModel(
        imagePath: "images/javascript.png",
        name: "JavaScript",
      ),
      SkillModel(
        imagePath: "images/cplusplus.png",
        name: "C++",
      ),
      SkillModel(
        imagePath: "images/godot.png",
        name: "GODOT",
      ),
      SkillModel(
        imagePath: "images/unity.jpg",
        name: "Unity",
      ),
    ],
  );

  // Handles Auto Switching to Dark Theme
  void nightTime() {
    // Waits 3 seconds before execution, giving more time for Scaffold to be built
    Future.delayed(
      const Duration(seconds: 3),
      () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Auto Switch to dark mode from 6pm above"),
          ),
        );
      },
    );

    // Sets dark period to 6pm
    DateTime nightTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 18, 50);

    // Calculates the duration before [nightTime]
    Duration diff = nightTime.difference(DateTime.now());
    //print(":::NIGHT TIME in ${diff.inHours}hours ${diff.inMinutes}minutes");

    // Auto switches theme when [nightTime] is passed
    Future.delayed(
      diff,
      () {
        //print(":::NIGHT TIME!!!");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Night Time! Switching to Dark Mode..."),
          ),
        );
        currentTheme.setTheme(ThemeMode.dark);
      },
    );
//    if (DateTime.now().isAfter(nightTime)) {}
  }

  @override
  Widget build(BuildContext context) {
    nightTime();
    return Scaffold(
      body: Container(
        // If in Landscape Orientation or device width is greater than 720, layout in a Row else as one PageView
        child: MediaQuery.of(context).orientation == Orientation.landscape ||
                MediaQuery.of(context).size.width > 720
            ?
            //Landscape
            Row(
                children: [
                  Expanded(
                    child: OverviewPage(
                      firstName: user.firstName,
                      lastName: user.lastName,
                      jobTitle: user.jobTitle,
                      profileImagePath: user.imagePath,
                    ),
                  ),
                  Expanded(
                    child: DetailsPage(user),
                  ),
                ],
              )
            :
            // Portrait
            PageView(
                scrollDirection: Axis.vertical,
                children: [
                  OverviewPage(
                    firstName: user.firstName,
                    lastName: user.lastName,
                    jobTitle: user.jobTitle,
                    profileImagePath: user.imagePath,
                  ),
                  DetailsPage(user),
                ],
              ),
      ),
    );
  }
}
