import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:home_design/common/images/images.dart';
import 'package:home_design/common/navigation/navigation_helper.dart';
import 'package:home_design/features/home/presentation/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => NavigationHelper.navigateAndReplace(context, const HomeScreen()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    log('screenWidth: $screenWidth');
    log('screenHeight: $screenHeight');

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              CommonImages.splashBg,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.39,
              child: Column(
                children: [
                  Image.asset(
                    CommonImages.qdUpdatedLogo,
                    height: screenHeight * 0.28,
                    width: screenWidth * 0.35,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  SizeTransition(
                    sizeFactor: _animation,
                    axis: Axis.horizontal,
                    axisAlignment: -1,
                    child: const Text(
                      "Efficiency Elevated: Quick Dine – Where Service Meets Speed!",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          decorationColor: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
