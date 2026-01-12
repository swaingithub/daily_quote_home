import 'package:daily_quote_home/features/collection/presentation/pages/collections_screen.dart';

import 'package:flutter/material.dart';
import 'package:daily_quote_home/features/quote/presentation/pages/home_screen.dart';
import 'package:daily_quote_home/features/settings/presentation/pages/settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CollectionsScreen(), // Updated to Collections view as per latest images
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: SafeArea( // Ensure it doesn't overlap home indicator
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              elevation: 0,
              backgroundColor: Colors.transparent, // Handled by Container
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Colors.grey.withOpacity(0.5),
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 10, letterSpacing: 1.0, color: Theme.of(context).colorScheme.primary),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 10, letterSpacing: 1.0, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: _currentIndex == 0 
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.home_filled, size: 24),
                            // Optional dot indicator if needed, but the label change is standard
                          ],
                        )
                      : const Icon(Icons.home_outlined, size: 24),
                  ),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: _currentIndex == 1
                     ? const Icon(Icons.favorite, size: 24)
                     : const Icon(Icons.favorite_border, size: 24),
                  ),
                  label: 'FAVORITES',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: _currentIndex == 2
                     ? const Icon(Icons.settings, size: 24)
                     : const Icon(Icons.settings_outlined, size: 24),
                  ),
                  label: 'SETTINGS',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
