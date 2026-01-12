import 'package:daily_quote_home/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: "",
      quote:
          "“The sun is a daily reminder that we too can rise again from the darkness.”",
      description:
          "Find daily sparks of wisdom to start your day with clarity.",
      type: OnboardingType.intro,
    ),
    OnboardingContent(
      title: "Express Your Voice",
      description:
          "Write and style your own thoughts into beautiful quote cards.",
      type: OnboardingType.personalize,
    ),
    OnboardingContent(
      title: "Reflect",
      description:
          "Track your growth and build a collection of what moves you.",
      type: OnboardingType.reflect,
    ),
  ];

  void _onNext() {
    if (_currentPage < _contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLastPage = _currentPage == _contents.length - 1;
    final isCyanPage = _contents[_currentPage].type == OnboardingType.personalize;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            : null,
        actions: [
          if (!isLastPage)
            TextButton(
              onPressed: _finishOnboarding,
              child: Text(
                'Skip',
                style: GoogleFonts.outfit(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _contents.length,
                itemBuilder: (context, index) {
                  return _OnboardingPage(content: _contents[index]);
                },
              ),
            ),
            // Pagination Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _contents.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 6,
                  width: _currentPage == index ? 24 : 6,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? (isCyanPage
                            ? const Color(0xFF28C2E5)
                            : (index == 2
                                ? const Color(0xFF4CAF50)
                                : theme.colorScheme.primary))
                        : Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Action Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCyanPage
                        ? const Color(0xFF28C2E5)
                        : theme.colorScheme.primary,
                    foregroundColor: isCyanPage ? Colors.white : theme.colorScheme.onPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLastPage ? 'Get Started' : 'Next',
                        style: GoogleFonts.outfit(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (!isLastPage) ...[
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_rounded, size: 20),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

enum OnboardingType { intro, personalize, reflect }

class OnboardingContent {
  final String title;
  final String? quote;
  final String description;
  final OnboardingType type;

  OnboardingContent({
    required this.title,
    this.quote,
    required this.description,
    required this.type,
  });
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingContent content;

  const _OnboardingPage({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (content.type == OnboardingType.intro) ...[
            Text(
              content.quote!,
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 32,
                color: Theme.of(context).colorScheme.onSurface,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 48),
            _buildSunriseGraphic(context),
          ] else if (content.type == OnboardingType.personalize) ...[
            Text(
              content.title,
              style: GoogleFonts.outfit(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 32),
            _buildPersonalizeGraphic(context),
            const SizedBox(height: 24),
            Text(
              "CHOOSE YOUR FONT STYLE",
              style: GoogleFonts.outfit(
                fontSize: 12,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFontOption(context, "Serif", true),
                const SizedBox(width: 12),
                _buildFontOption(context, "Sans", false),
                const SizedBox(width: 12),
                _buildFontOption(context, "Script", false),
              ],
            ),
          ] else ...[
            Text(
              content.title,
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
             const SizedBox(height: 32),
            _buildReflectGraphic(context),
          ],
          
          const Spacer(),
          Text(
            content.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.8),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSunriseGraphic(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 160,
            height: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary, // Dark sun
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
            ),
          ),
          // Rays would be complex to draw with containers, using simple lines for now or just the sun is cleaner
          Positioned(
             top: 10,
             child: Container(
               width: 2,
               height: 20,
               color: Theme.of(context).colorScheme.primary,
             ),
          ),
          // Horizontal line
          Container(
            height: 2,
            width: 200,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalizeGraphic(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, // Soft beige/pinkish
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.format_quote_rounded,
                      color: Color(0xFF28C2E5), size: 40),
                  const SizedBox(height: 16),
                  Text(
                    "The sun also rises.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "— ERNEST HEMINGWAY",
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFF28C2E5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.edit, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReflectGraphic(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(24),
           boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(12, (index) {
                // Mocking the grid
                bool isChecked = index < 5;
                bool isToday = index == 5;
                return Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isChecked
                        ? const Color(0xFFE8F5E9) // Light green
                        : (isToday ? const Color(0xFF4CAF50) : Theme.of(context).colorScheme.background),
                    shape: BoxShape.circle,
                  ),
                  child: isChecked
                      ? const Icon(Icons.check, size: 16, color: Color(0xFF4CAF50))
                      : (isToday ? const Icon(Icons.calendar_today, size: 16, color: Colors.white) : null),
                );
              }),
            ),
             const SizedBox(height: 24),
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               decoration: BoxDecoration(
                 color: Theme.of(context).cardTheme.color,
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.2)),
                 boxShadow: [
                   BoxShadow(
                     color: Theme.of(context).shadowColor.withOpacity(0.05),
                     blurRadius: 10,
                     offset: const Offset(0, 4),
                   )
                 ]
               ),
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   const Icon(Icons.local_fire_department_rounded, color: Color(0xFF4CAF50), size: 20),
                   const SizedBox(width: 8),
                   Text(
                     "12 Day Streak",
                     style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600),
                   )
                 ],
               ),
             )
          ],
        ),
    );
  }

  Widget _buildFontOption(BuildContext context, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).cardTheme.color : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? const Color(0xFF28C2E5) : Colors.transparent,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(
          color: isSelected ? const Color(0xFF28C2E5) : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
