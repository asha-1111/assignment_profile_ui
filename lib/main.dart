import 'package:flutter/material.dart';

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const ProfileScreen(),
    );
  }
}

const Color kBlue = Color(0xFF0A66C2);
const Color kBg = Color(0xFFF4F5F7);
const Color kTextDark = Color(0xFF2D3142);
const Color kTextGrey = Color(0xFF8A8F9C);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 380),
              child: Column(
                children: const [
                  ProfileCard(),
                  SizedBox(height: 20),
                  InterestsHeader(),
                  SizedBox(height: 12),
                  InterestsRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE3E5EA), width: 3),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Jane Doe', // change to John Doe if you prefer
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: kTextDark,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Flutter Developer',
            style: TextStyle(fontSize: 12.5, color: kTextGrey),
          ),
          const SizedBox(height: 12),
          const Text(
            'Passionate about creating user-friendly and engaging digital experiences.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.5, height: 1.4, color: kTextDark),
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFEDEEF1)),
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactRow(icon: Icons.email, text: 'jane.doe@example.com'),
                  SizedBox(height: 8),
                  ContactRow(icon: Icons.phone, text: '+123 456 7890'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final double w = constraints.maxWidth * 0.30;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text('Follow',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: w,
                    height: 30,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kTextDark,
                        padding: EdgeInsets.zero,
                        side: const BorderSide(color: Color(0xFFD0D3DA)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text('Message',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContactRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: kTextDark),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 12, color: kTextDark)),
      ],
    );
  }
}

class InterestsHeader extends StatelessWidget {
  const InterestsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const line = Expanded(child: Divider(color: Color(0xFFD5D8DE), thickness: 1));
    return Row(
      children: const [
        line,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Interests',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: kTextDark,
            ),
          ),
        ),
        line,
      ],
    );
  }
}

class InterestsRow extends StatelessWidget {
  const InterestsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(
            child: InterestCard(
              image: 'assets/images/travel.png',
              title: 'Travel',
              subtitle: 'Exploring new places around the world',
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: InterestCard(
              image: 'assets/images/photography.png',
              title: 'Photography',
              subtitle: 'Capturing moments through the lens',
              alignment: Alignment(0, 0.25),
            ),
          ),
        ],
      ),
    );
  }
}

class InterestCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Alignment alignment;

  const InterestCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: AspectRatio(
              aspectRatio: 2.0,
              child: Image.asset(image,
                  fit: BoxFit.cover, alignment: alignment),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: kTextDark,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 9, color: kTextGrey, height: 1.3),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 28,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFF0F1F4),
                foregroundColor: const Color(0xFF1877F2),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text('View More',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}