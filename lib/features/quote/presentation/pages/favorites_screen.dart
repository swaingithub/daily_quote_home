import 'package:daily_quote_home/features/quote/presentation/pages/quote_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ["All Quotes", "Mindfulness", "Wisdom", "Growth"];

  final List<Map<String, String>> _favorites = [
    {
      "quote": "“The only way to do great work is to love what you do.”",
      "author": "STEVE JOBS",
    },
    {
      "quote": "“In the middle of every difficulty lies opportunity.”",
      "author": "ALBERT EINSTEIN",
    },
    {
      "quote": "“Believe you can and you're halfway there.”",
      "author": "THEODORE ROOSEVELT",
    },
    {
      "quote": "“What we think, we become.”",
      "author": "BUDDHA",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary, // Dark FAB
        elevation: 4,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                    children: [
                       IconButton(
                        icon: Icon(Icons.arrow_back_ios_new, size: 20, color: Theme.of(context).colorScheme.onSurface),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        "Favorites",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 32,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search your collection...",
                  hintStyle: GoogleFonts.outfit(color: Colors.grey[400], fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
                  filled: true,
                  fillColor: Theme.of(context).cardTheme.color?.withOpacity(0.5), // Semi-transparent white
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Categories
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 24),
                itemBuilder: (context, index) {
                  final isSelected = _selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedCategoryIndex = index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _categories[index],
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected ? Theme.of(context).colorScheme.onSurface : Colors.grey,
                          ),
                        ),
                        if (isSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 24,
                            color: Theme.of(context).colorScheme.secondary, // Brownish underline
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // List of Cards
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: _favorites.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = _favorites[index];
                  return _buildQuoteCard(item['quote']!, item['author']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteCard(String quote, String author) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuoteDetailScreen(quote: quote, author: author),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.favorite,
                size: 20,
                color: Theme.of(context).colorScheme.secondary, // Muted brown/grey heart
              ),
            ),
            const SizedBox(height: 8),
            Text(
              quote,
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: 30,
              height: 1,
              color: Theme.of(context).dividerColor.withOpacity(0.2),
            ),
            const SizedBox(height: 16),
            Text(
              author,
              style: GoogleFonts.outfit(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
