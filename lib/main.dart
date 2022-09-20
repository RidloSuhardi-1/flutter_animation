import 'package:flutter/material.dart';

import 'animated_builder/animated_builder.dart';

void main() {
  runApp(const LogoApp());
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  // implementasi simultan animasi
  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // animation = Tween<double>(begin: 0, end: 300).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       // The state that has changed here is the animation object’s value.
    //     });
    //   });

    // implementasi animated widget
    // animation = Tween<double>(begin: 0, end: 300).animate(controller);

    // implementasi simultan animasi
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // implementasi animated builder
    // return GrowTransition(
    //   animation: animation,
    //   child: const LogoWidget(),
    // );

    // implementasi animated widget
    return AnimatedLogo(animation: animation);

    // return Center(
    //   child: Container(
    //     margin: const EdgeInsets.symmetric(vertical: 10),
    //     height: animation.value,
    //     width: animation.value,
    //     child: const FlutterLogo(),
    //   ),
    // );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
