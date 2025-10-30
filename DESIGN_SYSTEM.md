# Design System Documentation

## Visual Identity

### Brand Name
**Harsh Kumar Portfolio** - Mobile Application Developer | Flutter | Dart & Team Leader

### Design Philosophy
**"Sleek Minimalism with Bold Impact"**

The design combines modern professionalism with engaging interactivity, creating a portfolio that reflects technical expertise and leadership qualities.

---

## Color Palette

### Primary Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Professional Blue | `#2563EB` | Primary actions, CTAs, highlights |
| Innovation Purple | `#7C3AED` | Secondary accents, creativity indicators |
| Cyan Accent | `#06B6D4` | Growth elements, forward-thinking features |
| Emerald Success | `#10B981` | Achievements, positive metrics |
| Amber Warning | `#F59E0B` | Call-to-actions, highlights |

### Neutral Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Slate 900 | `#0F172A` | Dark mode background, primary text |
| Slate 50 | `#F8FAFC` | Light backgrounds |
| Slate 500 | `#64748B` | Secondary text, descriptions |

### Dark Theme Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Dark Background | `#0F172A` | Main background |
| Dark Surface | `#1E293B` | Cards, elevated surfaces |
| Dark Card | `#334155` | Interactive cards |

### Gradients

```dart
// Primary Gradient (Blue → Purple)
LinearGradient(
  colors: [#2563EB, #7C3AED],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)

// Accent Gradient (Cyan → Blue)
LinearGradient(
  colors: [#06B6D4, #2563EB],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

---

## Typography

### Font Families

**Headings**: Poppins (Google Fonts)
- Bold, modern, geometric
- Used for: Page titles, section headers, hero text

**Body Text**: Inter (Google Fonts)
- Highly readable, professional
- Used for: Paragraphs, descriptions, UI text

**Code/Tech**: JetBrains Mono
- Monospace font for technical details
- Used for: Stats, metrics, technical data

### Type Scale

| Element | Font | Size | Weight | Line Height |
|---------|------|------|--------|-------------|
| Display Large | Poppins | 72px | Bold | 1.1 |
| Display Medium | Poppins | 56px | Bold | 1.1 |
| Display Small | Poppins | 48px | Bold | 1.2 |
| Headline Large | Poppins | 40px | Bold | 1.2 |
| Headline Medium | Poppins | 32px | SemiBold | 1.3 |
| Headline Small | Poppins | 24px | SemiBold | 1.3 |
| Title Large | Inter | 20px | SemiBold | 1.4 |
| Title Medium | Inter | 18px | Medium | 1.4 |
| Title Small | Inter | 16px | Medium | 1.4 |
| Body Large | Inter | 18px | Regular | 1.6 |
| Body Medium | Inter | 16px | Regular | 1.6 |
| Body Small | Inter | 14px | Regular | 1.5 |

---

## Spacing System

Based on 8px grid:

| Token | Value | Usage |
|-------|-------|-------|
| xs | 4px | Tight spacing |
| sm | 8px | Small gaps |
| md | 16px | Standard spacing |
| lg | 24px | Section spacing |
| xl | 32px | Large gaps |
| 2xl | 48px | Major sections |
| 3xl | 64px | Page sections |
| 4xl | 80px | Desktop padding |

---

## Components

### Cards

**Properties:**
- Border radius: 16px
- Elevation: 0 (flat design)
- Background: White (light) / #334155 (dark)
- Padding: 24px
- Hover effect: Lift 8px with shadow

### Buttons

**Primary (Gradient Button):**
- Gradient background
- Border radius: 12px
- Padding: 20px horizontal, 16px vertical
- Shadow on hover
- Scale animation: 1.05

**Secondary (Outlined):**
- Transparent background
- 2px border
- Same dimensions as primary

### Navigation

**Desktop:**
- Sticky top bar
- Logo on left
- Horizontal menu items
- Theme toggle on right

**Mobile:**
- Hamburger menu
- Slide-out drawer
- Full-screen navigation

### Input Fields

- Border radius: 12px
- Filled style
- Border: 1px solid gray
- Focus: 2px solid primary color
- Padding: 20px

---

## Animations & Transitions

### Page Transitions
- Duration: 300ms
- Easing: easeInOut
- Effect: Fade + Slide (10% horizontal)

### Card Hover
- Duration: 200ms
- Transform: translateY(-8px)
- Shadow: Elevation increase

### Button Hover
- Duration: 200ms
- Transform: scale(1.05)
- Shadow: Glow effect

### Scroll Animations
- Fade in: 600ms
- Slide up: 0.2 offset, easeOutCubic
- Stagger delay: 100-200ms between items

### Counter Animation
- Duration: 2000ms
- Easing: easeOutCubic
- From 0 to target value

### Progress Bars
- Duration: 1000ms
- Easing: easeOut
- Fill animation with delay

---

## Page Layouts

### Home Page
- Full-height hero section
- Centered content
- Circular profile image with gradient glow
- Animated typing text
- CTA buttons below
- Stats section with counters

### About Page
- Two-column layout (desktop)
- Profile image left, content right
- Strengths grid (3 columns)
- Passions grid (4 columns)

### Skills Page
- Filter chips at top
- Two-column skill bars
- Category cards below
- Responsive grid

### Experience Page
- Vertical timeline
- Alternating left/right cards (desktop)
- Connected with gradient line
- Circular timeline dots

### Achievements Page
- 3-column grid (desktop)
- Icon with gradient background
- Metric badge at bottom

### Education Page
- Vertical list
- Icon + content layout
- Timeline style

### Contact Page
- Two-column (desktop)
- Contact info left
- Form right
- Social links

---

## Responsive Breakpoints

```dart
// Mobile
< 600px

// Tablet
600px - 1200px

// Desktop
> 1200px
```

### Behavior by Breakpoint

**Mobile (< 600px):**
- Single column layouts
- Hamburger menu
- Stacked cards
- Full-width elements

**Tablet (600px - 1200px):**
- 2-column grids
- Condensed navigation
- Balanced spacing

**Desktop (> 1200px):**
- Multi-column layouts
- Full navigation bar
- Maximum spacing
- Hover effects enabled

---

## Accessibility

### Color Contrast
- Text: WCAG AA compliant
- Minimum contrast ratio: 4.5:1
- Large text: 3:1

### Interactive Elements
- Minimum touch target: 44x44px
- Clear focus indicators
- Keyboard navigation support

### Motion
- Respects prefers-reduced-motion
- Can be toggled if needed

---

## Asset Guidelines

### Images
- Profile: Square, 400x400px minimum
- Compressed for web (WebP preferred)
- Fallback format: PNG/JPG

### Icons
- Font Awesome 6+
- Size: 20-32px
- Color: Inherit or brand colors

---

## Code Style

### File Naming
- Snake case: `home_page.dart`
- Clear, descriptive names
- Group by feature

### Widget Architecture
- Stateless when possible
- Separate UI and logic
- Reusable components in `/widgets`

### State Management
- Local state: setState
- Can integrate: Riverpod/Bloc for future scaling

---

Built with attention to detail, performance, and user experience.
