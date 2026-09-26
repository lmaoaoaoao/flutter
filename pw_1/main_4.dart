import 'package:flutter/material.dart';

void main() => runApp(const TasksApp());

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Today\'s Tasks',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Helvetica',
      ),
      home: const TasksPage(),
      debugShowMaterialGrid: false,
    );
  }
}

const Color kNavy = Color(0xFF000B23);
const Color kOrange = Color(0xFFFFB057);
const Color kPurple = Color(0xFF8E61E9);
const Color kRed = Color(0xFFE96161);
const Color kGreen = Color(0xFF61E98F);
const Color kAmber = Color(0xFFFFA011);
const Color kGrey = Color(0xFF7B7B80);
const Color kLightGrey = Color(0xFFE9E9EE);

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    _Dashboard(),
    _SimpleTab(icon: Icons.folder, label: 'Projects'),
    _SimpleTab(icon: Icons.calendar_month, label: 'Calendar'),
    _SimpleTab(icon: Icons.mail, label: 'Messages'),
    _SimpleTab(icon: Icons.group, label: 'Members'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _tabs),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Color(0x18000000), blurRadius: 10)],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kNavy,
          unselectedItemColor: kGrey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined),
              activeIcon: Icon(Icons.folder),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              activeIcon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail_outlined),
              activeIcon: Icon(Icons.mail),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined),
              activeIcon: Icon(Icons.group),
              label: 'Members',
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleTab extends StatelessWidget {
  const _SimpleTab({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: kNavy, size: 64),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: kNavy,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Good Evening!',
                      style: TextStyle(color: kGrey, fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Dan Smith',
                      style: TextStyle(
                        color: kNavy,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: kOrange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 30),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Text(
            'My Weekly Tasks',
            style: TextStyle(
              color: kNavy,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '18 Tasks Pending',
            style: TextStyle(color: kGrey, fontSize: 13),
          ),
          const SizedBox(height: 14),
          Row(
            children: const [
              _CategoryChip(label: 'UI/UX Design', color: kPurple),
              SizedBox(width: 10),
              _CategoryChip(label: 'Development', color: kOrange),
              SizedBox(width: 10),
              _CategoryChip(label: 'Marketing', color: kRed),
              SizedBox(width: 10),
              _CategoryChip(label: 'Crypto', color: kGreen),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _TaskCard(
                  tag: 'UI/UX Design',
                  tagColor: kPurple,
                  tagText: 'High',
                  title: 'Create a Landing Page',
                  date: 'Mon, 12 July 2022',
                  image: kOrange,
                  members: 3,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _TaskCard(
                  tag: 'Development',
                  tagColor: kAmber,
                  tagText: 'Low',
                  title: 'Develop a Website',
                  date: 'Mon, 30 July 2022',
                  image: kGreen,
                  members: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Today\'s Tasks',
            style: TextStyle(
              color: kNavy,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '18 Tasks Pending',
            style: TextStyle(color: kGrey, fontSize: 13),
          ),
          const SizedBox(height: 14),
          _TodayTask(
            title: 'Design 2 App Screens',
            subtitle: 'Crypto Wallet App',
            date: 'Mon, 10 July 2022',
          ),
          const SizedBox(height: 12),
          _TodayTask(
            title: 'Design Homepage',
            subtitle: 'Water Company Website',
            date: 'Mon, 10 July 2022',
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 46,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({
    required this.tag,
    required this.tagColor,
    required this.tagText,
    required this.title,
    required this.date,
    required this.image,
    required this.members,
  });

  final String tag;
  final Color tagColor;
  final String tagText;
  final String title;
  final String date;
  final Color image;
  final int members;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tag,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: tagColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                tagText,
                style: const TextStyle(
                  color: kGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: kGrey, size: 18),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: image,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.rocket_launch,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(
              color: kNavy,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: kGrey, size: 13),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: kGrey, fontSize: 11),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 110,
            height: 30,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _AvatarDot(
                  color: kRed,
                  offset: const Offset(0, 0),
                  icon: Icons.person,
                ),
                _AvatarDot(
                  color: kBluePerson,
                  offset: const Offset(18, 0),
                  icon: Icons.face,
                ),
                _AvatarDot(
                  color: kGreenPr,
                  offset: const Offset(36, 0),
                  icon: Icons.emoji_emotions,
                ),
                Positioned(
                  left: 56,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: kNavy,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '+$members',
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const Color kBluePerson = Color(0xFF3D78F2);
const Color kGreenPr = Color(0xFF4BD99B);

class _AvatarDot extends StatelessWidget {
  const _AvatarDot({
    required this.color,
    required this.offset,
    required this.icon,
  });

  final Color color;
  final Offset offset;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}

class _TodayTask extends StatelessWidget {
  const _TodayTask({
    required this.title,
    required this.subtitle,
    required this.date,
  });

  final String title;
  final String subtitle;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x10000000), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: kGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 16),
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(date, style: const TextStyle(color: kGrey, fontSize: 11)),
              const SizedBox(height: 4),
              const Text(
                '+1',
                style: TextStyle(color: kOrange, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
