import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

/// Premium Splash Screen for Taleem Plus
/// Features: Animated gradient background, glowing logo, floating particles, progress indicator
/// Design: Modern AI-powered EdTech platform with futuristic aesthetic

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoScaleController;
  late AnimationController _glowController;
  late AnimationController _particleController;
  late AnimationController _progressController;
  late List<ParticleModel> particles;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeParticles();
    _navigateToLogin();
  }

  void _initializeAnimations() {
    // Logo scale animation
    _logoScaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Glow pulse animation
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    // Particle animation
    _particleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Progress bar animation
    _progressController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Start animations
    _logoScaleController.forward();
    _progressController.forward();
  }

  void _initializeParticles() {
    particles = List.generate(
      15,
          (index) => ParticleModel(
        dx: Random().nextDouble() * 2 - 1,
        dy: (Random().nextDouble() * 0.5) - 0.25,
        radius: Random().nextDouble() * 3 + 1.5,
        opacity: Random().nextDouble() * 0.4 + 0.2,
      ),
    );
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void dispose() {
    _logoScaleController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF004D4D),
                      Color(0xFF006D6F),
                      Color(0xFF008080),
                      Color(0xFF004D4D),
                    ],
                    stops: [0.0, 0.3, 0.7, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // Dark Vignette Effect
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.4),
                ],
              ),
            ),
          ),

          // Floating Particles
          CustomPaint(
            painter: ParticlePainter(
              particles: particles,
              animation: _particleController,
            ),
            size: Size.infinite,
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                // Glowing Background Circle
                _buildGlowingCircle(),

                // Logo Icon
                _buildAnimatedLogo(),

                // App Name
                _buildAppName(),

                // Tagline
                _buildTagline(),

                const Spacer(flex: 2),

                // Progress Bar
                _buildProgressBar(),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlowingCircle() {
    return AnimatedBuilder(
      animation: _glowController,
      builder: (context, child) {
        return Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00E5FF)
                    .withOpacity(0.6 * _glowController.value),
                blurRadius: 60,
                spreadRadius: 20,
              ),
              BoxShadow(
                color: const Color(0xFF00E5FF)
                    .withOpacity(0.3 * _glowController.value),
                blurRadius: 100,
                spreadRadius: 40,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimatedLogo() {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(parent: _logoScaleController, curve: Curves.elasticOut),
      ),
      child: Transform.translate(
        offset: const Offset(0, -40),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00E5FF).withOpacity(0.3),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 80,
              height: 80,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.menu_book_rounded,
                size: 70,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppName() {
    return Transform.translate(
      offset: const Offset(0, -20),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(
          CurvedAnimation(parent: _logoScaleController, curve: Curves.easeOut),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'TALEEM PLUS',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagline() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _logoScaleController,
          curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'AI-POWERED. FULLY OFFLINE.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF00E5FF),
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return AnimatedBuilder(
      animation: _progressController,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _progressController.value,
                  minHeight: 3,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.lerp(
                      const Color(0xFF00E5FF),
                      Colors.white,
                      _progressController.value,
                    )!,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Loading Academy...',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.6),
                  letterSpacing: 0.5,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Particle Model for floating effect
class ParticleModel {
  final double dx;
  final double dy;
  final double radius;
  final double opacity;

  ParticleModel({
    required this.dx,
    required this.dy,
    required this.radius,
    required this.opacity,
  });
}

/// Custom Painter for animated particles
class ParticlePainter extends CustomPainter {
  final List<ParticleModel> particles;
  final Animation<double> animation;

  ParticlePainter({
    required this.particles,
    required this.animation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    for (int i = 0; i < particles.length; i++) {
      final particle = particles[i];
      final offset = animation.value * 200;

      final x = centerX + (particle.dx * offset);
      final y = centerY + (particle.dy * offset);

      // Fade out effect
      final fadeFactor = (1 - animation.value).clamp(0.0, 1.0);

      canvas.drawCircle(
        Offset(x, y),
        particle.radius,
        Paint()
          ..color = const Color(0xFF00E5FF).withOpacity(
            particle.opacity * fadeFactor * 0.8,
          )
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2),
      );
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}
