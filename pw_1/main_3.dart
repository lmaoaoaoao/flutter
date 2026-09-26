import 'package:flutter/material.dart';

void main() => runApp(const MeditateApp());

class MeditateApp extends StatelessWidget {
  const MeditateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditate',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Georgia',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MeditatePage(),
    );
  }
}

const Color kNavy = Color(0xFF1C1C1E);
const Color kTeal = Color(0xFF039EA2);
const Color kLightTeal = Color(0xFFE6FDFF);
const Color kYellow = Color(0xFFF2C94C);
const Color kGrey = Color(0xFF8A8A8E);

class MeditatePage extends StatefulWidget {
  const MeditatePage({super.key});

  @override
  State<MeditatePage> createState() => _MeditatePageState();
}

class _MeditatePageState extends State<MeditatePage> {
  final List<String> _filters = [
    'All',
    'Bible In a Year',
    'Dailies',
    'Minutes',
    'Novem',
  ];

  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 24),
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Meditate',
                    style: TextStyle(
                      color: kNavy,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.search, color: kNavy, size: 30),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _filters.map((f) {
                    final selected = f == _selectedFilter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedFilter = f),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selected ? kTeal : kLightTeal,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                            f,
                            style: TextStyle(
                              color: selected ? Colors.white : kTeal,
                              fontSize: 16,
                              fontWeight:
                                  selected ? FontWeight.bold : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      decoration: const BoxDecoration(
                        color: kYellow,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.nightlight_round,
                          color: Colors.white,
                          size: 110,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'A Song of Moon',
                            style: TextStyle(
                              color: kNavy,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Start with the basics',
                            style: TextStyle(color: kGrey, fontSize: 15),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              const Icon(
                                Icons.headphones,
                                color: kGrey,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                '9 Sessions',
                                style: TextStyle(
                                    color: kGrey, fontSize: 14),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 8),
                                decoration: BoxDecoration(
                                  color: kTeal,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Start',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _SmallCard(
                icon: Icons.bedtime,
                title: 'The Sleep Hour',
                author: 'Ashna Mukherjee',
                meta: '3 Sessions',
                color: Colors.purple.shade200,
              ),
              _SmallCard(
                icon: Icons.self_improvement,
                title: 'Easy on the Mission',
                author: 'Peter Mach',
                meta: '20 minutes',
                color: Colors.lightBlue.shade200,
              ),
              _SmallCard(
                icon: Icons.spa,
                title: 'Relax with Me',
                author: 'Amanda James',
                meta: '3 Sessions',
                color: Colors.pink.shade200,
              ),
              _SmallCard(
                icon: Icons.wb_sunny,
                title: 'Sun and Energy',
                author: 'Micheal Hiu',
                meta: '15 minutes',
                color: kYellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SmallCard extends StatelessWidget {
  const _SmallCard({
    required this.icon,
    required this.title,
    required this.author,
    required this.meta,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String author;
  final String meta;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 34),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  author,
                  style: const TextStyle(color: kGrey, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  meta,
                  style: const TextStyle(
                    color: kTeal,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: kTeal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}