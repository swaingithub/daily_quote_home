import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteDetailScreen extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteDetailScreen({
    super.key,
    this.quote = "“The only way to do great work is to love what you do.”",
    this.author = "Steve Jobs",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.grey),
          label: Text(
            "Back",
            style: GoogleFonts.outfit(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Theme.of(context).colorScheme.secondary), // Muted brown heart
          ),
          const SizedBox(width: 16),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Text(
                quote,
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 32,
                  color: const Color(0xFF2D2D2D),
                  height: 1.3,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 48),
              Container(
                width: 40,
                height: 1,
                color: Theme.of(context).dividerColor.withOpacity(0.2),
              ),
              const SizedBox(height: 24),
              Text(
                author,
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Co-founder of Apple Inc. and pioneer of the personal computer revolution.",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(context, Icons.ios_share, "SHARE"),
                  const SizedBox(width: 32),
                  _buildActionButton(context, Icons.download_outlined, "SAVE"),
                  const SizedBox(width: 32),
                  _buildActionButton(context, Icons.delete_outline, "REMOVE"),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.08)),
            color: Colors.transparent,
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7), size: 24),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
