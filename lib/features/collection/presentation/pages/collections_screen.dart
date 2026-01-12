import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daily_quote_home/features/collection/presentation/pages/new_collection_screen.dart';
import 'package:daily_quote_home/features/quote/presentation/pages/favorites_screen.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Your Collections",
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 32,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
            ),
            child: IconButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewCollectionScreen()),
                );
              },
              icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 80,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search collections...",
                  hintStyle: GoogleFonts.outfit(color: Colors.grey[400], fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
                  filled: true,
                  fillColor: Theme.of(context).cardTheme.color?.withOpacity(0.5),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.1)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(24),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: [
                  _buildCollectionCard(
                      context,
                      icon: Icons.wb_sunny_outlined,
                      title: "Morning Motivation",
                      count: "12 QUOTES"),
                  _buildCollectionCard(
                      context,
                      icon: Icons.spa_outlined,
                      title: "Daily Calm",
                      count: "24 QUOTES"),
                  _buildCollectionCard(
                      context,
                      icon: Icons.psychology_outlined,
                      title: "Self-Growth",
                      count: "08 QUOTES"),
                  _buildCollectionCard(
                      context,
                      icon: Icons.bookmark_border,
                      title: "Bookmarked",
                      count: "42 QUOTES"),
                  _buildCollectionCard(
                      context,
                      icon: Icons.favorite_border,
                      title: "Loved Ones",
                      count: "05 QUOTES"),
                  _buildAddFolderCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionCard(
      BuildContext context, {required IconData icon, required String title, required String count}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FavoritesScreen()),
        );
      },
      child: Container(
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
            const Spacer(),
            Text(
              title,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: GoogleFonts.outfit(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddFolderCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewCollectionScreen()),
                );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // Background matches scaffold
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            style: BorderStyle.solid, 
            width: 1, // Dashed border is tricky without custom painter, using solid light border or custom painter if strict. 
                      // Design shows DASHED border. Let's try CustomPaint or just a light solid one for simplicity if allowed. 
                      // Actually let's use a DottedBorder package or just approximate with a light grey border for now as per instructions to use simple tools.
                      // Wait, I can simulate a dashed look or just use a distinct style. The image shows a dashed line. 
                      // I will use a solid border with lower opacity as a fallback for "dashed" request without external packages unless I write a painter.
                      // Let's write a simple CustomPainter for dashed border to be precise.
          ),
        ),
        child: CustomPaint(
          painter: DashedRectPainter(color: Theme.of(context).dividerColor.withOpacity(0.4), strokeWidth: 1.5, gap: 5),
            child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color?.withOpacity(0.5), 
                    shape: BoxShape.circle,
                  ),
                   child: const Icon(Icons.add, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  "NEW FOLDER",
                  style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const Color white = Colors.white;

class DashedRectPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double gap;

  DashedRectPainter(
      {this.strokeWidth = 1.0, this.color = Colors.black, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double w = size.width;
    double h = size.height;
    double cornerRadius = 24.0; // Estimate from design

    RRect rrect = RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, w, h), Radius.circular(cornerRadius));
    
    Path path = Path()..addRRect(rrect);

    Path dashPath = Path();

    double dashWidth = 10.0;
    double dashSpace = gap;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, dashedPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
