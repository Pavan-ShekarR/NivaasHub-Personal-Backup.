
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color navy = Color(0xFF0E2543);
  static const Color orange = Color(0xFFFC7118);
  static const Color lightText = Color(0xFFF1F8FF);

  late final VideoPlayerController _videoController;
  final TextEditingController _mobileController =
      TextEditingController();

  bool _videoReady = false;

  @override
  void initState() {
    super.initState();

    // Draw behind the Android system bars.
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
      ),
    );

    _videoController = VideoPlayerController.asset(
      'assets/videos/onboarding_screen5.mp4',
    );

    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      await _videoController.initialize();
      await _videoController.setLooping(true);
      await _videoController.setVolume(0);
      await _videoController.play();

      if (!mounted) return;

      setState(() {
        _videoReady = true;
      });
    } catch (error, stackTrace) {
      debugPrint('Login background video failed: $error');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void _handleLogin() {
    final mobile = _mobileController.text.trim();

    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(mobile)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid 10-digit mobile number.',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP integration is pending.'),
      ),
    );
  }

  void _handleRegistration() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration navigation is pending.'),
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
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
                  const ColoredBox(color: navy),

                  // Background video — settings unchanged.
                  Positioned(
                    left: -1,
                    top: 340,
                    width: 442,
                    height: 616,
                    child: _videoReady
                        ? ClipRect(
                            child: Opacity(
                              opacity: 0.30,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: _videoController
                                      .value.size.width,
                                  height: _videoController
                                      .value.size.height,
                                  child: VideoPlayer(
                                    _videoController,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const ColoredBox(color: navy),
                  ),

                  // Video gradient — unchanged.
                  Positioned(
                    left: 0,
                    top: 340,
                    width: 440,
                    height: 616,
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              navy,
                              const Color(0x000E2543),
                              const Color(0x000E2543),
                              navy,
                            ],
                            stops: const [
                              0.0,
                              0.18,
                              0.78,
                              1.0,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Logo — unchanged.
                  Positioned(
                    left: 95,
                    top: 135,
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/images/blackLogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Welcome heading — unchanged.
                  const Positioned(
                    left: 20,
                    top: 400,
                    width: 400,
                    child: Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'DMSans',
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ),

                  // Subtitle — unchanged.
                  const Positioned(
                    left: 30,
                    top: 445,
                    width: 380,
                    height: 28,
                    child: Text(
                      'Login to access your Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: lightText,
                        fontFamily: 'DMSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  

                  // Phone field — same width and margins as the button.
                  Positioned(
                    left: 20,
                    top: 590,
                    width: 400,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: orange),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '🇮🇳',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '+91',
                                  style: TextStyle(
                                    color: Color(0xFF0B1625),
                                    fontFamily: 'DMSans',
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  height: 25,
                                  child: VerticalDivider(
                                    width: 1,
                                    color: Color(0xFF9EA1A8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _mobileController,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              style: const TextStyle(
                                color: Color(0xFF161D2A),
                                fontFamily: 'DMSans',
                                fontSize: 14,
                              ),
                              decoration: const InputDecoration(
                                counterText: '',
                                hintText: 'Enter mobile number',
                                hintStyle: TextStyle(
                                  color: Color(0xFF9EA1A8),
                                  fontFamily: 'DMSans',
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ),

                  // OTP button — same width and margins as the field.
                  Positioned(
                    left: 20,
                    top: 669,
                    width: 400,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Center(
                            child: Text(
                              'Login with OTP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 0,
                            child: Icon(
                              Icons.phone_android,
                              size: 21,
                            ),
                          ),
                          const Positioned(
                            right: 0,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Registration prompt — unchanged position.
                  Positioned(
                    left: 10,
                    top: 795,
                    width: 400,
                    height: 35,
                    child: Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment:
                            WrapCrossAlignment.center,
                        children: [
                          const Text(
                            'New to Nivaas Hub? ',
                            style: TextStyle(
                              color: Color(0xFF9AA7B5),
                              fontFamily: 'DMSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: _handleRegistration,
                            child: const Text(
                              'Create an account',
                              style: TextStyle(
                                color: orange,
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
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
