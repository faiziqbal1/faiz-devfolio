
import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 42,
              backgroundColor: Color(0xFFDBEAFE),
              child: Icon(
                Icons.code,
                size: 45,
                color: Color(0xFF2563EB),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Faiz Iqbal',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Full Stack Developer | ERP Implementer',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            const Text(
              'I build business applications, ERP modules, '
                  'and software solutions using PHP, Laravel, '
                  'MySQL, and Flutter.',
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 28),
            const Text(
              'Technical Skills',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                SkillChip('PHP'),
                SkillChip('Laravel'),
                SkillChip('MySQL'),
                SkillChip('REST APIs'),
                SkillChip('JavaScript'),
                SkillChip('Flutter'),
                SkillChip('Git'),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Experience',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const ExperienceCard(
              role: 'Full Stack Developer & ERP Implementer',
              company: 'EEZBOOK ERP',
              period: 'July 2022 – June 2026',
              description:
              'Developed ERP modules, supported implementations, '
                  'and helped businesses use accounting and inventory systems.',
            ),
            const SizedBox(height: 12),
            const ExperienceCard(
              role: 'Full Stack Developer',
              company: 'Esoft Private Limited',
              period: 'November 2017 – June 2022',
              description:
              'Worked on web application development and backend features.',
            ),
            const SizedBox(height: 28),
            const Text(
              'Featured Projects',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const ProjectCard(
              title: 'ERP Management System',
              description:
              'Business workflows, accounting, inventory, and reporting.',
              technology: 'Laravel • PHP • MySQL',
            ),
            const ProjectCard(
              title: 'Asset Tracking Application',
              description:
              'Mobile asset tracking with barcode scanning and GPS features.',
              technology: 'Flutter • Laravel • REST API',
            ),
            const ProjectCard(
              title: 'FBR Invoice Integration',
              description:
              'Integration work for electronic invoicing workflows.',
              technology: 'PHP • APIs',
            ),
            const SizedBox(height: 28),
            const Text(
              'Contact',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.email_outlined),
              title: Text('faiziqbal91@gmail.com'),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.location_on_outlined),
              title: Text('Islamabad, Pakistan'),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}

class ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final String description;

  const ExperienceCard({
    super.key,
    required this.role,
    required this.company,
    required this.period,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(company),
            Text(
              period,
              style: const TextStyle(color: Colors.blueGrey),
            ),
            const SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String technology;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technology,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 10),
            Text(
              technology,
              style: const TextStyle(
                color: Color(0xFF2563EB),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
