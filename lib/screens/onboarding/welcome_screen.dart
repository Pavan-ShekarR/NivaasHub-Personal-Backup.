
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreenTwo extends StatefulWidget {
  const OnboardingScreenTwo({super.key});

  @override
  State<OnboardingScreenTwo> createState() =>
      _OnboardingScreenTwoState();
}

class _OnboardingScreenTwoState extends State<OnboardingScreenTwo> {
  static const Color backgroundColor = Color(0xFFF9FFFB);
  static const Color navy = Color(0xFF0E2543);

  @override
  void initState() {
    super.initState();

    // Allow the screen to draw behind Android system bars.
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      body: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: 440,
            height: 956,
            child: ClipRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Full-canvas background.
                  const ColoredBox(
                    color: backgroundColor,
                  ),

                  // Background illustration.
                  // Original opacity is preserved.
                  Positioned(
                    left: -40,
                    right: -40,
                    top: 530,
                    bottom: -20,
                    child: Opacity(
                      opacity: 0.45,
                      child: Image.asset(
                        'assets/images/onboard_8_transparent.png',
                        fit: BoxFit.fill,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  // NivaasHub stacked logo.
                  Positioned(
                    left: 39,
                    top: 77,
                    width: 361,
                    height: 361,
                    child: Image.asset(
                      'assets/images/nivas_welcomelogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Welcome heading.
                  const Positioned(
                    left: 116,
                    top: 425,
                    width: 209,
                    height: 49,
                    child: Text(
                      'Welcome!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: navy,
                        fontFamily: 'DMSans',
                        fontSize: 42,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                      ),
                    ),
                  ),

                  // NivaasHub heading.
                  const Positioned(
                    left: 72,
                    top: 482,
                    width: 295,
                    height: 49,
                    child: Text(
                      'To NivaasHub',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: navy,
                        fontFamily: 'DMSans',
                        fontSize: 38,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
