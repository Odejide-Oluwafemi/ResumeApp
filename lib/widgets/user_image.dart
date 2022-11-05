import 'package:flutter/material.dart';

// The Profile Image shown on the Overview Page (animated as well)
class UserImage extends StatefulWidget {
  /// The initial radius
  final double startSize;

  /// The final radius
  final double endSize;

  /// Path to the image file
  final String? profileImagePath;

  /// Creates a CircleAvater Profile Image with an Intro Animation
  const UserImage({
    super.key,
    required this.startSize,
    required this.endSize,
    this.profileImagePath,
  });

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage>
    with SingleTickerProviderStateMixin {
  // The AnimationController controls the animation
  late AnimationController _controller;

  // The Animation itself
  late Animation<double> sizeAnimation;

  // Runs when this class is instantiated
  @override
  void initState() {
    // Calls initState() on the inherited parent
    super.initState();

    //  Initializes the properties for the animation e.g. Duration
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // Sets the animation values
    sizeAnimation = Tween<double>(begin: widget.startSize, end: widget.endSize)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    // Redraws the widget being animated every Tick
    _controller.addListener(() {
      setState(() {});
    });

    // Sets the animation to play forward
    _controller.forward();
  }

  // Triggered when the object of this class is removed from the Widget tree (like a Destructor)
  @override
  void dispose() {
    // Disposes our controller
    _controller.dispose();

    // calls dispose() on parent
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: sizeAnimation.value,
      backgroundImage: AssetImage(widget.profileImagePath!),
      child: widget.profileImagePath != null
          // Uses an Icon when no image path is provided
          ? Container()
          : const Icon(
              Icons.person,
              size: 90,
              color: Colors.white,
            ),
    );
  }
}
