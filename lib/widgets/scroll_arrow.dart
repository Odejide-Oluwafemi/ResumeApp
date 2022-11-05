import 'package:flutter/material.dart';

/// Animated Arrows indicating to the user that there is another page beneath
/// Would probably make it reuseable...later...perhaps.
class ScrollArrow extends StatefulWidget {
  const ScrollArrow({super.key});

  @override
  State<ScrollArrow> createState() => _ScrollArrowState();
}

class _ScrollArrowState extends State<ScrollArrow>
    with TickerProviderStateMixin {
  // Setting up
  late AnimationController _controller;
  late AnimationController _controllerSlow;
  late AnimationController _controllerVSlow;
  late Animation<double> floatAnimationCenter;
  late Animation<double> floatAnimationTop;
  late Animation<double> floatAnimationBottom;

  @override
  void initState() {
    // Initializing
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controllerSlow = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 50),
    );
    _controllerVSlow = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    floatAnimationCenter = Tween<double>(begin: 19, end: 8).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic));
    Tween<double>(begin: 16, end: 3).animate(
        CurvedAnimation(parent: _controllerSlow, curve: Curves.easeInOutCubic));
    Tween<double>(begin: 16, end: 3).animate(CurvedAnimation(
        parent: _controllerVSlow, curve: Curves.easeInOutCubic));
    floatAnimationTop =
        Tween<double>(begin: 4, end: -1).animate(_controllerSlow);
    floatAnimationBottom =
        Tween<double>(begin: 46, end: 38).animate(_controllerVSlow);

    _controller.addListener(() {
      setState(() {});
    });
    _controllerSlow.addListener(() {
      setState(() {});
    });
    _controllerVSlow.addListener(() {
      setState(() {});
    });

    _controller.repeat(reverse: true);
    _controllerSlow.repeat(reverse: true);
    _controllerVSlow.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerSlow.dispose();
    _controllerVSlow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 80,
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: floatAnimationTop.value,
            child: const Text(
              '^',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
          Positioned(
            top: floatAnimationCenter.value,
            child: const Text(
              '^',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
              ),
            ),
          ),
          Positioned(
            top: floatAnimationBottom.value,
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
    );
  }
}
