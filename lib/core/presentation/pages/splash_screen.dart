import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Premium Design Palette
    // Dark Space Blue / Nebula / Neon accent
    const colorBg1 = Color(0xFF0F172A); // Slate 900
    const colorAccent = Color(0xFF6366F1); // Indigo 500
    const colorAccentPop = Color(0xFFC084FC); // Purple 400

    return Scaffold(
      backgroundColor: colorBg1,
      body: Stack(
        children: [
          // Background Animated Blobs
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [colorAccent.withValues(alpha: 0.3), Colors.transparent],
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scale(begin: const Offset(1, 1), end: const Offset(1.5, 1.5), duration: 4.seconds)
            .rotate(begin: 0, end: 0.1, duration: 5.seconds),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [colorAccentPop.withValues(alpha: 0.2), Colors.transparent],
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 5.seconds, delay: 1.seconds),
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Composition
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Spinning Outer Ring
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colorAccent.withValues(alpha: 0.5),
                            width: 2,
                          ),
                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                      .rotate(duration: 8.seconds),

                      // Inner Glow
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: colorAccent.withValues(alpha: 0.6),
                              blurRadius: 20,
                              spreadRadius: 5,
                            )
                          ],
                        ),
                      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .fadeIn(duration: 1.seconds)
                      .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1), duration: 1.seconds, curve: Curves.easeInOut),

                      // Icon
                       const Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 50,
                        color: Colors.white,
                      ).animate()
                      .scale(begin: const Offset(0, 0), end: const Offset(1, 1), duration: 800.ms, curve: Curves.elasticOut)
                      .then()
                      .shimmer(duration: 2.seconds, color: Colors.white),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),

                // App Name with Gradient Text
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.white, Color(0xFF818CF8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds),
                  child: const Text(
                    'LEDGERLY',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color: Colors.white, // Required for ShaderMask
                    ),
                  ),
                ).animate()
                .fadeIn(duration: 800.ms, delay: 300.ms)
                .moveY(begin: 20, end: 0, duration: 800.ms, curve: Curves.easeOut),

                const SizedBox(height: 16),

                // Tagline
                const Text(
                  'Future of Finance',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300,
                  ),
                ).animate()
                .fadeIn(duration: 800.ms, delay: 800.ms),
              ],
            ),
          ),
          
          // Bottom Loading Indicator
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: const CircularProgressIndicator(
                  color: colorAccent,
                  strokeWidth: 2,
                ),
              ),
            ).animate()
            .fadeIn(delay: 2.seconds),
          ),
        ],
      ),
    );
  }
}
