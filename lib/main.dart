import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FaizPortfolioApp());
}

const Color primaryBlue = Color(0xFF2563EB);
const Color paleBlue = Color(0xFFEFF6FF);
const Color ink = Color(0xFF0F172A);
const Color muted = Color(0xFF64748B);
const Color borderColor = Color(0xFFE2E8F0);
const Color pageColor = Color(0xFFF8FAFC);

class FaizPortfolioApp extends StatelessWidget {
  const FaizPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faiz Iqbal | Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: borderColor),
          ),
        ),
      ),
      home: const PortfolioShell(),
    );
  }
}

class PortfolioShell extends StatefulWidget {
  const PortfolioShell({super.key});

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  int selectedIndex = 0;

  static const List<String> titles = [
    'Home',
    'Projects',
    'Experience',
    'Contact',
  ];

  void goTo(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      HomePage(onNavigate: goTo),
      const ProjectsPage(),
      const ExperiencePage(),
      const ContactPage(),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 800;
        return Scaffold(
          appBar: AppBar(
            titleSpacing: isWide ? 32 : 20,
            title: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.code_rounded,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FAIZ IQBAL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.1,
                      ),
                    ),
                    Text(
                      'Developer Portfolio',
                      style: TextStyle(fontSize: 11, color: muted),
                    ),
                  ],
                ),
                const Spacer(),
                if (isWide)
                  for (var i = 0; i < titles.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: TextButton(
                        onPressed: () => goTo(i),
                        style: TextButton.styleFrom(
                          foregroundColor: selectedIndex == i
                              ? primaryBlue
                              : muted,
                          backgroundColor: selectedIndex == i
                              ? paleBlue
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                        ),
                        child: Text(titles[i]),
                      ),
                    ),
              ],
            ),
          ),
          body: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1120),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 180),
                  child: SingleChildScrollView(
                    key: ValueKey<int>(selectedIndex),
                    padding: EdgeInsets.fromLTRB(
                      isWide ? 32 : 20,
                      24,
                      isWide ? 32 : 20,
                      36,
                    ),
                    child: pages[selectedIndex],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: isWide
              ? null
              : NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: goTo,
                  backgroundColor: Colors.white,
                  indicatorColor: paleBlue,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home_rounded),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.folder_outlined),
                      selectedIcon: Icon(Icons.folder_rounded),
                      label: 'Projects',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.work_outline_rounded),
                      selectedIcon: Icon(Icons.work_rounded),
                      label: 'Experience',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.mail_outline_rounded),
                      selectedIcon: Icon(Icons.mail_rounded),
                      label: 'Contact',
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onNavigate});

  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 720;
        final intro = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatusPill(
              icon: Icons.work_outline_rounded,
              label: 'OPEN TO EMPLOYMENT & FREELANCE',
            ),
            const SizedBox(height: 22),
            Text(
              'Hello, I’m\nFaiz Iqbal.',
              style: TextStyle(
                fontSize: wide ? 54 : 40,
                height: 1.08,
                fontWeight: FontWeight.w800,
                letterSpacing: -1.5,
                color: ink,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Full Stack Developer  •  ERP Implementer',
              style: TextStyle(
                color: primaryBlue,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'I build and support business software, ERP modules, backend APIs, and database-driven applications. My experience combines software development with practical ERP implementation and user support.',
              style: TextStyle(color: muted, height: 1.7, fontSize: 15),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 10,
              children: [
                FilledButton.icon(
                  onPressed: () => onNavigate(1),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('View projects'),
                ),
                OutlinedButton.icon(
                  onPressed: () => onNavigate(3),
                  icon: const Icon(Icons.mail_outline_rounded),
                  label: const Text('Contact me'),
                ),
              ],
            ),
          ],
        );

        final profile = Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 240),
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFEAF2FF), Color(0xFFF8FBFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFD7E5FF)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  color: primaryBlue,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withValues(alpha: 0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.terminal_rounded,
                  size: 55,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Software that solves\nbusiness problems.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ink,
                  fontSize: 21,
                  height: 1.35,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Islamabad, Pakistan', style: TextStyle(color: muted)),
            ],
          ),
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: intro),
                  const SizedBox(width: 36),
                  Expanded(flex: 4, child: profile),
                ],
              )
            else ...[
              profile,
              const SizedBox(height: 28),
              intro,
            ],
            const SizedBox(height: 36),
            const SectionHeading(
              eyebrow: 'CORE CAPABILITIES',
              title: 'What I work with',
              subtitle:
                  'Practical skills developed through real software projects.',
            ),
            const SizedBox(height: 18),
            const ResponsiveGrid(
              children: [
                CapabilityCard(
                  icon: Icons.layers_outlined,
                  title: 'ERP Development',
                  description: 'Business modules, workflows, inventory, accounting, and operational systems.',
                ),
                CapabilityCard(
                  icon: Icons.storage_rounded,
                  title: 'Backend & Databases',
                  description: 'PHP, Laravel, MySQL, REST APIs, and database-driven applications.',
                ),
                CapabilityCard(
                  icon: Icons.settings_suggest_outlined,
                  title: 'Implementation & Support',
                  description: 'Configuration, user training, troubleshooting, and production support.',
                ),
                CapabilityCard(
                  icon: Icons.fact_check_outlined,
                  title: 'Testing & Validation',
                  description: 'Functional testing, UAT support, API checks, and SQL data validation.',
                ),
              ],
            ),
            const SizedBox(height: 36),
            const SectionHeading(
              eyebrow: 'SELECTED WORK',
              title: 'Projects worth exploring',
              subtitle: 'Examples of business software and integrations I have worked on.',
            ),
            const SizedBox(height: 18),
            const ResponsiveGrid(
              children: [
                ProjectCard(
                  icon: Icons.business_center_outlined,
                  title: 'ERP Management System',
                  summary: 'ERP modules for accounting, inventory, procurement, assets, and MIS.',
                  technologies: ['PHP', 'Laravel', 'MySQL'],
                  details: 'Worked on extending an ERP product, implementing business modules, troubleshooting, user training, and client support across multiple business sectors.',
                ),
                ProjectCard(
                  icon: Icons.qr_code_scanner_rounded,
                  title: 'Asset Tracking Application',
                  summary: 'Mobile asset workflows with barcode/QR support and location-related data.',
                  technologies: ['Flutter', 'Laravel', 'REST API'],
                  details: 'Contributed to an asset tracking solution involving Flutter, Laravel APIs, barcode/QR workflows, GPS-related information, image handling, and batch data processing.',
                ),
                ProjectCard(
                  icon: Icons.receipt_long_outlined,
                  title: 'FBR E-Invoice Integration',
                  summary: 'Integration work connecting business software with e-invoicing workflows.',
                  technologies: ['Laravel', 'PHP', 'APIs'],
                  details: 'Worked on FBR e-invoice integration for power-house and IT service clients. Exact deployment and compliance details should be confirmed for each client before publication.',
                ),
              ],
            ),
            const SizedBox(height: 28),
            Center(
              child: OutlinedButton.icon(
                onPressed: () => onNavigate(1),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text('Explore all projects'),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'PORTFOLIO',
          title: 'Selected projects',
          subtitle: 'Business-focused software work, integrations, and mobile application development.',
        ),
        const SizedBox(height: 22),
        const ResponsiveGrid(
          children: [
            ProjectCard(
              icon: Icons.business_center_outlined,
              title: 'ERP Management System',
              summary: 'A business management platform with interconnected operational and financial modules.',
              technologies: ['PHP', 'Laravel', 'MySQL', 'JavaScript'],
              details: 'At EEZBOOK ERP, contributed to ERP development and implementation across FMCG, manufacturing, construction, trading, and distribution contexts. Work included accounting, inventory, procurement, fixed assets, MIS, workflow automation, training, and support.',
            ),
            ProjectCard(
              icon: Icons.qr_code_scanner_rounded,
              title: 'Asset Tracking Application',
              summary: 'Mobile and backend workflows for tracking assets and maintaining related records.',
              technologies: ['Flutter', 'Laravel', 'REST API', 'GPS'],
              details: 'Contributed to an asset tracking solution involving Flutter and Laravel, barcode/QR workflows, GPS-related data, images, UUID-based history, and batched API processing. Flutter is an area of active development and portfolio growth.',
            ),
            ProjectCard(
              icon: Icons.receipt_long_outlined,
              title: 'FBR E-Invoice Integration',
              summary: 'Connecting client business software with e-invoicing workflows.',
              technologies: ['PHP', 'Laravel', 'API Integration'],
              details: 'Worked on FBR e-invoice integration for power-house and IT service clients. Confirm exact client names, production status, and scope before publishing confidential implementation details.',
            ),
          ],
        ),
        const SizedBox(height: 20),
        const InfoBanner(
          text: 'Project descriptions are intentionally high-level. Add only screenshots, client names, metrics, and source-code links that you are permitted to share.',
        ),
      ],
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'CAREER',
          title: 'Professional experience',
          subtitle: 'Software development, ERP implementation, client support, and business workflows.',
        ),
        const SizedBox(height: 24),
        const ExperienceCard(
          company: 'EEZBOOK ERP (Private) Limited',
          role: 'Full Stack Developer & ERP Implementer',
          dates: 'July 2022 – June 2026',
          location: 'Islamabad, Pakistan',
          bullets: [
            'Developed and extended ERP modules for accounting, inventory, procurement, fixed assets, MIS, and workflow automation.',
            'Supported implementation, configuration, troubleshooting, and user training before and after production releases.',
            'Worked with business users across FMCG, manufacturing, construction, trading, and distribution contexts.',
            'Used PHP, Laravel, MySQL, REST APIs, JavaScript, jQuery/AJAX, HTML, CSS, Bootstrap, and Git.',
          ],
        ),
        const SizedBox(height: 16),
        const ExperienceCard(
          company: 'Esoft Private Limited',
          role: 'Full Stack Developer',
          dates: 'November 2017 – June 2022',
          location: 'Pakistan',
          bullets: [
            'Worked on full-stack web development using PHP-based technologies.',
            'Contributed to application features, database-backed functionality, debugging, and maintenance.',
            'Built a foundation in web application development before moving into ERP-focused work.',
          ],
        ),
        const SizedBox(height: 24),
        const SectionHeading(
          eyebrow: 'TECH STACK',
          title: 'Tools and technologies',
          subtitle:
              'Grouped by practical use rather than overstated proficiency.',
        ),
        const SizedBox(height: 16),
        const SkillGroup(
          title: 'Backend',
          skills: ['PHP', 'Laravel', 'REST APIs', 'MySQL'],
        ),
        const SkillGroup(
          title: 'Frontend',
          skills: [
            'JavaScript',
            'jQuery',
            'AJAX',
            'HTML5',
            'CSS3',
            'Bootstrap',
          ],
        ),
        const SkillGroup(
          title: 'Workflow',
          skills: [
            'Git',
            'Postman',
            'SQL Validation',
            'Functional Testing',
            'UAT Support',
          ],
        ),
        const SkillGroup(
          title: 'Mobile',
          skills: ['Flutter', 'Dart'],
          note: 'Currently building and improving Flutter portfolio work.',
        ),
      ],
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const String email = 'faiziqbal91@gmail.com';
  static const String linkedIn = 'https://linkedin.com/in/faiz-iqbal-8507b6144';
  static const String github = 'https://github.com/faiziqbal1';

  Future<void> copyText(BuildContext context, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'GET IN TOUCH',
          title: 'Let’s work together.',
          subtitle: 'Open to suitable developer roles and freelance projects involving business applications.',
        ),
        const SizedBox(height: 22),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleIcon(icon: Icons.mail_outline_rounded, size: 54),
                const SizedBox(height: 18),
                const Text(
                  'Have a project or opportunity?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: ink,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Reach out by email or connect through my professional profiles.',
                  style: TextStyle(color: muted, height: 1.6),
                ),
                const SizedBox(height: 20),
                ContactLinkTile(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  value: email,
                  onTap: () => copyText(context, email),
                ),
                ContactLinkTile(
                  icon: Icons.business_center_outlined,
                  label: 'LinkedIn',
                  value: linkedIn,
                  onTap: () => copyText(context, linkedIn),
                ),
                ContactLinkTile(
                  icon: Icons.code_rounded,
                  label: 'GitHub',
                  value: github,
                  onTap: () => copyText(context, github),
                ),
                const SizedBox(height: 10),
                const InfoBanner(
                  text: 'Tap a contact item to copy its address or profile URL. You can paste it into your browser or preferred app.',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),
        const Row(
          children: [
            Icon(Icons.location_on_outlined, color: primaryBlue),
            SizedBox(width: 8),
            Text('Islamabad, Pakistan', style: TextStyle(color: muted)),
          ],
        ),
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final String eyebrow;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.4,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: ink,
            fontWeight: FontWeight.w800,
            fontSize: 27,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(color: muted, height: 1.6, fontSize: 14),
        ),
      ],
    );
  }
}

class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFECFDF5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFBBF7D0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: const Color(0xFF15803D)),
          const SizedBox(width: 7),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF166534),
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 900
            ? 3
            : constraints.maxWidth >= 580
            ? 2
            : 1;
        const gap = 14.0;
        final itemWidth =
            (constraints.maxWidth - (gap * (columns - 1))) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: children
              .map((child) => SizedBox(width: itemWidth, child: child))
              .toList(),
        );
      },
    );
  }
}

class CapabilityCard extends StatelessWidget {
  const CapabilityCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleIcon(icon: icon),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                color: ink,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(color: muted, height: 1.6, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.summary,
    required this.technologies,
    required this.details,
  });

  final IconData icon;
  final String title;
  final String summary;
  final List<String> technologies;
  final String details;

  void showDetails(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(details, style: const TextStyle(height: 1.6)),
              const SizedBox(height: 18),
              const Text(
                'Technologies',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              SkillChips(skills: technologies),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => showDetails(context),
        child: Padding(
          padding: const EdgeInsets.all(19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleIcon(icon: icon, size: 48),
                  const Spacer(),
                  const Icon(Icons.arrow_outward_rounded, color: primaryBlue),
                ],
              ),
              const SizedBox(height: 17),
              Text(
                title,
                style: const TextStyle(
                  color: ink,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                summary,
                style: const TextStyle(color: muted, height: 1.6, fontSize: 13),
              ),
              const SizedBox(height: 15),
              SkillChips(skills: technologies),
              const SizedBox(height: 12),
              const Text(
                'View details',
                style: TextStyle(
                  color: primaryBlue,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.company,
    required this.role,
    required this.dates,
    required this.location,
    required this.bullets,
  });

  final String company;
  final String role;
  final String dates;
  final String location;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleIcon(icon: Icons.work_outline_rounded, size: 46),
                const SizedBox(width: 13),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style: const TextStyle(
                          color: ink,
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        role,
                        style: const TextStyle(
                          color: primaryBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        '$dates  •  $location',
                        style: const TextStyle(color: muted, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Divider(color: borderColor),
            const SizedBox(height: 8),
            for (final bullet in bullets)
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.circle, size: 7, color: primaryBlue),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        bullet,
                        style: const TextStyle(
                          color: muted,
                          height: 1.6,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SkillGroup extends StatelessWidget {
  const SkillGroup({
    super.key,
    required this.title,
    required this.skills,
    this.note,
  });

  final String title;
  final List<String> skills;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: ink,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 12),
            SkillChips(skills: skills),
            if (note != null) ...[
              const SizedBox(height: 10),
              Text(note!, style: const TextStyle(color: muted, fontSize: 12)),
            ],
          ],
        ),
      ),
    );
  }
}

class SkillChips extends StatelessWidget {
  const SkillChips({super.key, required this.skills});

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills.map<Widget>((skill) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: borderColor),
          ),
          child: Text(
            skill,
            style: const TextStyle(
              color: Color(0xFF334155),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.icon, this.size = 46});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: paleBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: primaryBlue, size: size * 0.48),
    );
  }
}

class ContactLinkTile extends StatelessWidget {
  const ContactLinkTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 3),
      leading: CircleIcon(icon: icon, size: 42),
      title: Text(
        label,
        style: const TextStyle(
          color: ink,
          fontWeight: FontWeight.w800,
          fontSize: 13,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(color: muted, fontSize: 12),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.copy_rounded, size: 18, color: primaryBlue),
      onTap: onTap,
    );
  }
}

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: paleBlue,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFD7E5FF)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline_rounded, color: primaryBlue, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF334155),
                height: 1.5,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
