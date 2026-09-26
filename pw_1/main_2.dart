import 'package:flutter/material.dart';

void main() => runApp(const RelaxApp());

class RelaxApp extends StatelessWidget {
  const RelaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mind Relax',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Georgia',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const RelaxPage(),
    );
  }
}

const Color kNavy = Color(0xFF1C1C1E);
const Color kTeal = Color(0xFF039EA2);
const Color kBlue = Color(0xFF2F80ED);
const Color kOrange = Color(0xFFF09235);
const Color kYellow = Color(0xFFF2C94C);
const Color kGrey = Color(0xFF8A8A8E);

class RelaxPage extends StatelessWidget {
  const RelaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 6, 20, 14),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: kNavy,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Peter Mach',
                      style: TextStyle(
                        color: kNavy,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle_outline,
                        color: kNavy,
                        size: 28,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: kNavy,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 210,
                margin: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: kYellow,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 14,
                      left: 14,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(Icons.spa, color: kNavy, size: 28),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: kNavy,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.pause_circle_outline,
                        color: Colors.white,
                        size: 76,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Mind Deep Relax',
                  style: TextStyle(
                    color: kNavy,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Join the Community as we prepare over 33 days '
                  'to relax and feel joy with the mind and happnies '
                  'session across the World.',
                  style: TextStyle(color: kGrey, fontSize: 15, height: 1.35),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: kOrange,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Center(
                    child: Text(
                      'Play Next Session',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(color: Color(0xFFEBEBEC), thickness: 1),
              _SessionTile(
                icon: 'book',
                title: 'Sweet Memories',
                subtitle: 'December 29 Pre-Launch',
                color: kTeal,
              ),
              const Divider(
                color: Color(0xFFEBEBEC),
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              _SessionTile(
                icon: 'bedtime',
                title: 'A Day Dream',
                subtitle: 'December 29 Pre-Launch',
                color: kBlue,
              ),
              const Divider(
                color: Color(0xFFEBEBEC),
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              _SessionTile(
                icon: 'explore',
                title: 'Mind Explore',
                subtitle: 'December 29 Pre-Launch',
                color: kOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final String icon;
  final String title;
  final String subtitle;
  final Color color;

  IconData _toIcon() {
    switch (icon) {
      case 'bedtime':
        return Icons.bedtime;
      case 'explore':
        return Icons.explore;
      default:
        return Icons.menu_book;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(_toIcon(), color: Colors.white, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: kNavy,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(color: kGrey, fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kGrey.withValues(alpha: 0.5)),
            ),
            child: const Icon(Icons.play_arrow_rounded, color: kNavy, size: 20),
          ),
        ],
      ),
    );
  }
}
