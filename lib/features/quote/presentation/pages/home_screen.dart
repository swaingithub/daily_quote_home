import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "THE DAILY INSIGHT",
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                "“Simplicity is the ultimate sophistication.”",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 42,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "LEONARDO DA VINCI",
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   IconButton(
                    icon: const Icon(Icons.favorite, size: 28),
                    color: Theme.of(context).colorScheme.primary, // Using primary/black
                    onPressed: () {},
                  ),
                  const SizedBox(width: 32),
                  IconButton(
                    icon: const Icon(Icons.refresh, size: 28),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 32),
                  IconButton(
                    icon: const Icon(Icons.share_outlined, size: 28),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {},
                  ),
                ],
              ),
              const Spacer(),
              const SizedBox(height: 48), // Space for bottom nav visual balance
            ],
          ),
        ),
      ),
    );
  }
}
