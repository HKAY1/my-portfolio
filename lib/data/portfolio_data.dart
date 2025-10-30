import '../models/portfolio_models.dart';

// Personal Information
const String fullName = 'Harsh Kumar';
const String tagline =
    'Mobile Application Developer | Flutter | Dart & Team Leader';
const List<String> heroSubtitles = [
  'Building scalable Flutter apps',
  'Leading high-performing teams',
  'Creating impactful solutions',
  'Architecting clean code',
];

const String aboutSummary = '''
Results-driven Flutter developer with a strong track record in building scalable cross-platform apps and leading high-performing teams. Proficient in MVVM/BLoC architecture, state management (Riverpod, GetX, Bloc), and Firebase integration. Experienced in backend integration, mentoring developers, and managing agile teams to deliver high-quality, maintainable code. Strong leadership, communication, and decision-making skills in fast-paced, collaborative environments.
''';

// Contact Information
const contactInfo = ContactInfo(
  email: 'harsh.kumar.p001@gmail.com',
  phone: '+91 9625520902',
  location: 'Delhi, India',
);

// Social Links
const socialLinks = [
  SocialLink(
    name: 'LinkedIn',
    url:
        'https://linkedin.com/in/harsh-kumar-b8034020a?', // Update with actual URL
    icon: 'linkedin',
  ),
  SocialLink(
    name: 'GitHub',
    url: 'https://github.com/HKAY1', // Update with actual URL
    icon: 'github',
  ),
];

// Quick Stats
const quickStats = [
  QuickStat(value: '3', label: 'Years Experience', suffix: '+'),
  QuickStat(value: '10', label: 'Apps Delivered', suffix: '+'),
  QuickStat(value: '300', label: 'Package Downloads', suffix: '+'),
  QuickStat(value: '160', label: 'Pub Points', suffix: '/160'),
];

// Strengths
const strengths = [
  Strength(
    title: 'Architectural Thinking',
    description:
        'Skilled in designing scalable and modular app architectures using MVVM, BLoC, and clean code principles for long-term maintainability and performance.',
    icon: 'architecture',
  ),
  Strength(
    title: 'System Design Expertise',
    description:
        'Proficient in analyzing requirements, defining data flow, and designing robust systems with efficient component separation, API structure, and state management strategies.',
    icon: 'system',
  ),
  Strength(
    title: 'Leadership in Action',
    description:
        'Lead teams with a clear vision, fostering collaboration, code quality, and ownership while driving projects from planning to successful delivery.',
    icon: 'leadership',
  ),
  Strength(
    title: 'Fast Learner & Adaptive',
    description:
        'Quickly grasps new tools, frameworks, and project requirements; adapts to shifting priorities without compromising on quality or timelines.',
    icon: 'learning',
  ),
  Strength(
    title: 'Strong Problem Solver',
    description:
        'Approaches complex technical challenges with clarity and precision, delivering efficient and scalable solutions under tight deadlines.',
    icon: 'problem-solving',
  ),
  Strength(
    title: 'Collaborative & Communicative',
    description:
        'Builds trust and transparency across cross-functional teams, ensuring smooth coordination and shared accountability.',
    icon: 'communication',
  ),
];

// Passions
const passions = [
  Passion(
    title: 'Empowering Through Code',
    description:
        'Love creating apps that make life easier, more productive, and more delightful for users.',
    icon: 'code',
  ),
  Passion(
    title: 'Fostering Developer Growth',
    description:
        'Enjoy mentoring peers, leading teams, and creating collaborative engineering cultures.',
    icon: 'mentorship',
  ),
  Passion(
    title: 'Open Source & Community',
    description:
        'Actively contribute to Flutter\'s open-source ecosystem, sharing tools that help others ship faster.',
    icon: 'opensource',
  ),
  Passion(
    title: 'Building for Impact',
    description:
        'Motivated by building scalable products that solve real-world problems.',
    icon: 'impact',
  ),
];

// Skills
const skillsData = [
  // Core Development
  Skill(name: 'Flutter & Dart', proficiency: 95, category: 'dev'),
  Skill(name: 'Firebase', proficiency: 90, category: 'dev'),
  Skill(name: 'Riverpod', proficiency: 90, category: 'dev'),
  Skill(name: 'BLoC Pattern', proficiency: 90, category: 'dev'),
  Skill(name: 'GetX', proficiency: 85, category: 'dev'),
  Skill(name: 'Provider', proficiency: 85, category: 'dev'),
  Skill(name: 'Clean Architecture', proficiency: 90, category: 'dev'),
  Skill(name: 'API Integration', proficiency: 95, category: 'dev'),
  Skill(name: 'Flutter Web', proficiency: 85, category: 'dev'),
  Skill(name: 'SQLite', proficiency: 85, category: 'dev'),

  // Languages & Tools
  Skill(name: 'Git', proficiency: 95, category: 'tools'),
  Skill(name: 'Razorpay', proficiency: 80, category: 'tools'),
  Skill(name: 'Google Maps', proficiency: 85, category: 'tools'),
  Skill(name: 'Kotlin', proficiency: 70, category: 'tools'),
  Skill(name: 'Swift', proficiency: 65, category: 'tools'),
  Skill(name: 'Postman', proficiency: 90, category: 'tools'),
  Skill(name: 'REST APIs', proficiency: 95, category: 'tools'),
  Skill(name: 'CI/CD', proficiency: 80, category: 'tools'),

  // Soft Skills
  Skill(name: 'Team Leading', proficiency: 95, category: 'soft'),
  Skill(name: 'Mentorship', proficiency: 90, category: 'soft'),
  Skill(name: 'Strategic Thinking', proficiency: 85, category: 'soft'),
  Skill(name: 'Time Management', proficiency: 90, category: 'soft'),
  Skill(name: 'Decision-Making', proficiency: 90, category: 'soft'),
  Skill(name: 'Communication', proficiency: 95, category: 'soft'),
];

const skillCategories = [
  SkillCategory(
    title: 'Core Development',
    skills: [
      'Flutter & Dart',
      'Firebase',
      'State Management (Riverpod, Bloc, Provider, GetX)',
      'Clean Architecture',
      'API Integration',
      'Flutter Web',
    ],
  ),
  SkillCategory(
    title: 'Languages & Tools',
    skills: [
      'Dart',
      'Git',
      'Razorpay',
      'Google Maps',
      'sqflite',
      'Kotlin',
      'Swift',
      'Postman',
    ],
  ),
  SkillCategory(
    title: 'Team & Workflow',
    skills: [
      'CI/CD',
      'Code Reviews',
      'Documentation',
      'Agile',
      'GitHub Projects',
      'Version Control',
    ],
  ),
  SkillCategory(
    title: 'APIs & Integration',
    skills: ['REST APIs', 'SOAP APIs', 'Webhook APIs', 'Postman'],
  ),
  SkillCategory(
    title: 'System Design',
    skills: [
      'Scalable App Architecture',
      'Local Database Design',
      'API Layer Abstraction',
      'Data Flow & Dependency Management',
    ],
  ),
];

// Experience
const experiences = [
  Experience(
    role: 'SDE-1',
    company: 'Algofast India Pvt. Ltd',
    location: 'Delhi, India',
    startDate: '10/2024',
    endDate: 'Present',
    description:
        'Algofast is a tech startup founded by the creators of BUSY Accounting Software, building smart solutions for MSMEs.',
    highlights: [
      'Spearheaded UI/UX optimization, resulting in a 30% increase in user retention',
      'Developed scalable and performant apps using Flutter and Firebase',
      'Led team of 4 developers, reducing bug turnaround time by 50%',
      'Designed the local database system for Sachiv using sqflite, enabling reliable offline access and scalable data handling',
    ],
  ),
  Experience(
    role: 'Flutter Developer',
    company: 'Cotgin Analytics Pvt. Ltd',
    location: 'Delhi, India',
    startDate: '04/2024',
    endDate: '10/2024',
    description: '',
    highlights: [
      'Delivered 2 production apps that contributed to a 35% increase in client satisfaction',
      'Oversaw a team of 6 developers across multiple projects, achieving 90% on-time delivery',
      'Introduced code review and testing pipelines, reducing production bugs by 45%',
    ],
  ),
  Experience(
    role: 'Flutter Developer',
    company: 'Shri Sahib Technologies',
    location: 'Delhi, India',
    startDate: '01/2023',
    endDate: '03/2024',
    description: '',
    highlights: [
      'Designed reusable Riverpod architecture, enabling 3x faster development of subsequent modules',
      'Integrated Flutter Web solutions that opened new B2B leads, contributing to a 20% rise in client portfolio',
      'Initiated internal DevOps pipeline, improving team deployment efficiency by 60%',
    ],
  ),
  Experience(
    role: 'Flutter Developer',
    company: 'Inept Studio',
    location: 'Delhi, India',
    startDate: '07/2021',
    endDate: '01/2023',
    description: '',
    highlights: [
      'Developed 5+ applications and tailored state management to fit project scope (Bloc, GetX)',
      'Established client onboarding protocols, improving project start times and team clarity',
      'Helped company grow app development capacity by 2x, expanding its monthly deliverables from 2 to 5 projects',
    ],
  ),
];

// Key Achievements
const achievements = [
  Achievement(
    title: 'Open Source Recognition',
    description:
        'Published and maintained searchable_textfeild, an open-source Flutter package with 160/160 Pub Points and 300+ downloads.',
    icon: 'opensource',
    metric: '160/160 Points',
  ),
  Achievement(
    title: 'Leadership in Product Delivery',
    description:
        'Led and delivered two full-scale Flutter applications within tight deadlines, improving overall team delivery speed by 40%.',
    icon: 'delivery',
    metric: '40% Faster',
  ),
  Achievement(
    title: 'Architecture Implementation',
    description:
        'Introduced scalable MVVM Bloc structure across multiple projects, reducing bug reports and improving maintainability by 60%.',
    icon: 'architecture',
    metric: '60% Improvement',
  ),
  Achievement(
    title: 'Team Mentorship',
    description:
        'Mentored junior developers and streamlined onboarding, reducing ramp-up time by 50% and improving team velocity.',
    icon: 'mentorship',
    metric: '50% Faster',
  ),
  Achievement(
    title: 'Cross-Platform Expertise',
    description:
        'Contributed to both mobile and web Flutter applications, expanding company offerings and enabling 25% more client acquisitions.',
    icon: 'platform',
    metric: '25% Growth',
  ),
  Achievement(
    title: 'Process & CI/CD Setup',
    description:
        'Improved development workflow with CI/CD integration and Git strategy, reducing deployment times by 70%.',
    icon: 'cicd',
    metric: '70% Faster',
  ),
];

// Education
const education = [
  Education(
    degree: 'B.TECH (Computer Science and Engineering)',
    institution: 'NSUT East Campus (AIACTR)',
    location: 'Delhi, India',
    startDate: '09/2019',
    endDate: '09/2023',
  ),
  Education(
    degree: 'Intermediate',
    institution: 'Brahma Shakti Public School',
    location: 'Delhi, India',
    startDate: '04/2017',
    endDate: '05/2018',
  ),
  Education(
    degree: 'High School',
    institution: 'ST. Johns Convent',
    location: 'Delhi, India',
    startDate: '04/2015',
    endDate: '05/2016',
  ),
];
