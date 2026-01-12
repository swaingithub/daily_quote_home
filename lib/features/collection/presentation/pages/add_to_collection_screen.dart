import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCollectionScreen extends StatefulWidget {
  const AddToCollectionScreen({super.key});

  @override
  State<AddToCollectionScreen> createState() => _AddToCollectionScreenState();
}

class _AddToCollectionScreenState extends State<AddToCollectionScreen> {
  final List<int> _selectedIndices = [];

  final List<Map<String, String>> _quotes = [
    {
      "quote": "“The only way to do great work is to love what you do.”",
      "author": "STEVE JOBS"
    },
    {
      "quote": "“Happiness is not something ready made. It comes from your own actions.”",
      "author": "DALAI LAMA"
    },
    {
      "quote": "“Believe you can and you're halfway there.”",
      "author": "THEODORE ROOSEVELT"
    },
    {
      "quote": "“It does not matter how slowly you go as long as you do not stop.”",
      "author": "CONFUCIUS"
    },
     {
      "quote": "“Act as if what you do makes a difference. It does.”",
      "author": "WILLIAM JAMES"
    },
  ];

  void _toggleSelection(int index) {
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: Theme.of(context).colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add to Collection",
          style: GoogleFonts.dmSerifDisplay(
            color: Theme.of(context).colorScheme.onSurface, // Serif used in image title? Actually image has Serif title "Add to Collection"
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 100), // Bottom padding for floating button
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search your favorites...",
                    hintStyle: GoogleFonts.outfit(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
                    filled: true,
                    fillColor: Theme.of(context).cardTheme.color,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _quotes.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final quote = _quotes[index];
                    final isSelected = _selectedIndices.contains(index);
                    return GestureDetector(
                      onTap: () => _toggleSelection(index),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.color,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor.withOpacity(0.01),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    quote['quote']!,
                                    style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 18,
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontStyle: FontStyle.italic,
                                      height: 1.3,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    quote['author']!,
                                    style: GoogleFonts.outfit(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
                                border: Border.all(
                                  color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).dividerColor.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: isSelected
                                  ? Icon(Icons.check, size: 16, color: Theme.of(context).colorScheme.onPrimary)
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: _selectedIndices.isEmpty ? null : () {
                   // Add logic, then pop or show success
                   Navigator.pop(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  disabledBackgroundColor: Colors.grey[300],
                  disabledForegroundColor: Colors.grey[500],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  shadowColor: Theme.of(context).shadowColor.withOpacity(0.3),
                ),
                child: Text(
                  "Add Selected (${_selectedIndices.length})",
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
