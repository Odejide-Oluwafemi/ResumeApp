import 'package:flutter/material.dart';
import 'package:resume_app/misc/config.dart';
import 'package:resume_app/widgets/main_text.dart';
import 'package:resume_app/widgets/scroll_arrow.dart';
import 'package:resume_app/widgets/user_image.dart';

/// A Summary of the Users' Profile
class OverviewPage extends StatelessWidget {
  /// Users' Image Path
  final String? profileImagePath;

  /// Users; Job Title
  final String jobTitle;

  /// Users' Last Name
  final String lastName;

  /// Users' First Name
  final String firstName;

  const OverviewPage({
    super.key,
    this.profileImagePath,
    required this.jobTitle,
    required this.lastName,
    required this.firstName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: MainText(
            "Resume App",
            color: Colors.white,
          ),
        ),
        // Right Side of [AppBar]
        actions: [
          // Theme Switch button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(
                Icons.mode_night_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                currentTheme.switchTheme();
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),

            //DETAILS
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserImage(
                  profileImagePath: profileImagePath,
                  startSize: 20,
                  endSize: MediaQuery.of(context).orientation ==
                              Orientation.landscape ||
                          MediaQuery.of(context).size.width > 720
                      ? 120
                      : 160,
                ),
                const SizedBox(height: 15),
                MainText(
                  "$lastName $firstName",
                  size: 32,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                MainText(
                  jobTitle,
                  size: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),

            const Expanded(child: SizedBox()),
            //BOTTOM ARROW
            MediaQuery.of(context).orientation == Orientation.landscape
                ? Container()
                : const SizedBox(
                    child: ScrollArrow(),
                  ),
          ],
        ),
      ),
    );
  }
}
