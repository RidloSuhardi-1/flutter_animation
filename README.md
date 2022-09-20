# flutter_animation

A new Flutter project.

## Hasil Praktikum

        class widget LogoApp

        import 'package:flutter/material.dart';

        void main() => runApp(const LogoApp());

        class LogoApp extends StatefulWidget {
        const LogoApp({super.key});

        @override
        State<LogoApp> createState() => _LogoAppState();
        }

        class _LogoAppState extends State<LogoApp> {
        @override
        Widget build(BuildContext context) {
            return Center(
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 300,
                width: 300,
                child: const FlutterLogo(),
            ),
            );
        }
        }

<img src="images/1.png">

- Rendering animations

    <img src="images/default.gif">

- Simplifying with Animated­Widget

    <img src="images/animated-widget.gif">

- Monitoring the progress of the animation

    <img src="images/monitoring-status.gif">

- Refactoring with AnimatedBuilder

    <img src="images/animated-builder.gif">

- Simultaneous animations

    <img src="images/simultan-animasi.gif">
