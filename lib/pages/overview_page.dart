import 'package:flutter/material.dart';
import 'package:resume_app/misc/config.dart';
import 'package:resume_app/widgets/main_text.dart';

class OverviewPage extends StatelessWidget {
  final String? profileImagePath;
  final String jobTitle;
  final String lastName;
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
      appBar: AppBar(
        // toolbarHeight: 30,
        centerTitle: true,
        elevation: 0,
        //backgroundColor:
        //currentTheme.inDarkMode() ? Colors.black : AppColors.appColor,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: MainText(
            "Resume App",
            color: Colors.white,
          ),
        ),
        actions: [
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
                CircleAvatar(
                  maxRadius: 150,
                  backgroundImage: AssetImage(profileImagePath!),
                  child: profileImagePath != null
                      ? Container()
                      : const Icon(
                          Icons.person,
                          size: 90,
                          color: Colors.white,
                        ),
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
                : Container(
                    width: 36,
                    height: 80,
                    alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        const Positioned(
                          child: Text(
                            '^',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 16,
                          child: Text(
                            '^',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
