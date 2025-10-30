# Portfolio Web - Harsh Kumar

A stunning, responsive portfolio website built with **Flutter Web** showcasing professional experience, skills, achievements, and projects.

## ✨ NEW in Version 2.0

### 🎨 Enhanced Visual Design
- **Glassmorphism UI**: Frosted glass cards with blur effects and gradient borders
- **Animated Gradients**: Dynamic mesh backgrounds with floating orbs
- **Floating Particles**: Interactive particle system in hero section (30+ animated particles)
- **Theme Toggle**: One-click light/dark mode switching with Riverpod state management
- **Smooth Transitions**: 60 FPS animations throughout

## 🎨 Design Features

- **Modern UI/UX**: Sleek minimalism with bold impact and glassmorphism
- **Responsive Design**: Optimized for mobile, tablet, and desktop
- **Smooth Animations**: Using `flutter_animate` for engaging user experience
- **Dynamic Theme Switching**: Real-time light/dark mode toggle with persistent state
- **Custom Typography**: Google Fonts (Poppins + Inter)
- **Gradient Accents**: Professional blue gradient theme with animated backgrounds
- **Interactive Elements**: Advanced hover effects, lift animations, and micro-interactions
- **Glassmorphic Cards**: Modern frosted glass effect with backdrop blur
- **Particle Animations**: Organic floating particles with connecting lines

## 🚀 Tech Stack

- **Flutter 3.24+**
- **Dart 3.0+**
- **Material Design 3**
- **go_router** - Navigation
- **flutter_riverpod** - State Management ⭐ NEW
- **flutter_animate** - Animations
- **google_fonts** - Typography
- **font_awesome_flutter** - Icons
- **url_launcher** - External links

## 📁 Project Structure

```
lib/
├── config/
│   └── theme.dart              # Theme configuration (colors, typography)
├── data/
│   └── portfolio_data.dart     # All portfolio content
├── models/
│   └── portfolio_models.dart   # Data models
├── pages/
│   ├── home_page.dart          # Landing page with hero section
│   ├── about_page.dart         # About me, strengths, passions
│   ├── skills_page.dart        # Technical skills with filters
│   ├── experience_page.dart    # Professional timeline
│   ├── achievements_page.dart  # Key accomplishments
│   ├── education_page.dart     # Academic background
│   └── contact_page.dart       # Contact form and info
├── routes/
│   └── app_router.dart         # go_router configuration
├── utils/
│   └── responsive.dart         # Responsive utilities
├── widgets/
│   ├── nav_bar.dart            # Navigation bar
│   ├── footer.dart             # Footer component
│   ├── custom_card.dart        # Reusable card with hover
│   ├── gradient_button.dart    # Gradient button component
│   ├── section_title.dart      # Section headers
│   ├── skill_bar.dart          # Animated skill progress bars
│   ├── skill_chip.dart         # Skill filter chips
│   └── animated_counter.dart   # Animated statistics counter
└── main.dart                   # App entry point
```

## 🛠️ Setup Instructions

### Prerequisites

- Flutter SDK (3.24 or higher)
- Dart SDK (3.0 or higher)
- A code editor (VS Code, Android Studio, etc.)

### Installation

1. **Install dependencies**
   ```bash
   flutter pub get
   ```

2. **Verify Flutter setup**
   ```bash
   flutter doctor
   ```

3. **Run on web**
   ```bash
   flutter run -d chrome
   ```

## 🎯 Customization

### Update Portfolio Content

Edit `lib/data/portfolio_data.dart` to customize:

- Personal information (name, email, phone, location)
- Social links (LinkedIn, GitHub, etc.)
- Experience details
- Skills and proficiencies
- Achievements
- Education
- Strengths and passions

### Change Color Theme

Edit `lib/config/theme.dart` to modify:

- Primary/secondary colors
- Gradients
- Typography
- Card styles
- Button themes

### Add Profile Image

1. Add your image to `assets/images/profile.jpg`
2. Update `pubspec.yaml` if needed
3. Replace the text-based avatar in home/about pages with:
   ```dart
   Image.asset('assets/images/profile.jpg')
   ```

## 🌐 Deployment

### Deploy to Firebase Hosting

1. **Build for web**
   ```bash
   flutter build web --release
   ```

2. **Install Firebase CLI**
   ```bash
   npm install -g firebase-tools
   ```

3. **Initialize Firebase**
   ```bash
   firebase login
   firebase init hosting
   ```
   - Select your project
   - Set public directory to `build/web`
   - Configure as single-page app: Yes
   - Don't overwrite index.html

4. **Deploy**
   ```bash
   firebase deploy
   ```

### Deploy to GitHub Pages

1. **Build for web**
   ```bash
   flutter build web --release --base-href "/your-repo-name/"
   ```

2. **Create gh-pages branch and deploy**
   ```bash
   git checkout -b gh-pages
   cp -r build/web/* .
   git add .
   git commit -m "Deploy to GitHub Pages"
   git push origin gh-pages
   ```

3. **Enable GitHub Pages**
   - Go to repository Settings → Pages
   - Select `gh-pages` branch

### Deploy to Vercel

1. **Build for web**
   ```bash
   flutter build web --release
   ```

2. **Deploy**
   ```bash
   vercel --prod
   ```
   - Set output directory to `build/web`

### Deploy to Netlify

1. **Build for web**
   ```bash
   flutter build web --release
   ```

2. **Deploy** by dragging `build/web` folder to Netlify or use CLI:
   ```bash
   netlify deploy --prod --dir=build/web
   ```

## 🔧 Development

### Run in Debug Mode
```bash
flutter run -d chrome
```

### Run Tests
```bash
flutter test
```

### Analyze Code
```bash
flutter analyze
```

### Format Code
```bash
dart format .
```

## 📱 Responsive Breakpoints

- **Mobile**: < 600px
- **Tablet**: 600px - 1200px
- **Desktop**: > 1200px

## 🎨 Color Palette

- **Primary**: `#2563EB` (Professional Blue)
- **Secondary**: `#7C3AED` (Innovation Purple)
- **Accent**: `#06B6D4` (Cyan)
- **Success**: `#10B981` (Emerald)
- **Warning**: `#F59E0B` (Amber)

## 📧 Contact

**Harsh Kumar**
- Email: harsh.kumar.p001@gmail.com
- Phone: +91 9625520902
- Location: Delhi, India

---

Built with ❤️ using Flutter Web
# my-portfolio
