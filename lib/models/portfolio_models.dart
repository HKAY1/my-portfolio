// Portfolio Data Models

class SocialLink {
  final String name;
  final String url;
  final String icon;

  const SocialLink({
    required this.name,
    required this.url,
    required this.icon,
  });
}

class QuickStat {
  final String value;
  final String label;
  final String? suffix;

  const QuickStat({
    required this.value,
    required this.label,
    this.suffix,
  });
}

class Strength {
  final String title;
  final String description;
  final String icon;

  const Strength({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class Passion {
  final String title;
  final String description;
  final String icon;

  const Passion({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class Skill {
  final String name;
  final double proficiency; // 0-100
  final String category; // 'dev', 'tools', 'soft'

  const Skill({
    required this.name,
    required this.proficiency,
    required this.category,
  });
}

class SkillCategory {
  final String title;
  final List<String> skills;

  const SkillCategory({
    required this.title,
    required this.skills,
  });
}

class Experience {
  final String role;
  final String company;
  final String location;
  final String startDate;
  final String endDate;
  final String description;
  final List<String> highlights;

  const Experience({
    required this.role,
    required this.company,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.highlights,
  });
}

class Achievement {
  final String title;
  final String description;
  final String icon;
  final String? metric;

  const Achievement({
    required this.title,
    required this.description,
    required this.icon,
    this.metric,
  });
}

class Education {
  final String degree;
  final String institution;
  final String location;
  final String startDate;
  final String endDate;

  const Education({
    required this.degree,
    required this.institution,
    required this.location,
    required this.startDate,
    required this.endDate,
  });
}

class ContactInfo {
  final String email;
  final String phone;
  final String location;

  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
  });
}
