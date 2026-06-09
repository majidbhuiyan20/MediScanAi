import 'package:flutter/material.dart';
class OrbitLoader extends StatefulWidget {
  const OrbitLoader({super.key});

  @override
  State<OrbitLoader> createState() => _OrbitLoaderState();
}

class _OrbitLoaderState extends State<OrbitLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 135,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Second static background orbit ring (outer)
          Container(
            width: 135,
            height: 135,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blueAccent.withOpacity(.1),
              ),
            ),
          ),

          // Static background orbit ring
          Container(
            width: 115,
            height: 115,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.deepPurple.withOpacity(.15),
              ),
            ),
          ),

          // Rotating orbit dots
          AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              return Transform.rotate(
                angle: controller.value * 6.28318,
                child: Stack(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Transform.rotate(
                        angle: i * 1.5708,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

          // Background container behind the center
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple.withOpacity(0.1),
            ),
          ),

          // Fixed AI Center
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF8A8DFF), Color(0xFF5B4FFF)],
              ),
            ),
            child: const Center(
              child: Text(
                'AI',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}