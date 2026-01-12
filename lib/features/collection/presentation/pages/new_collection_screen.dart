import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daily_quote_home/features/collection/presentation/pages/add_to_collection_screen.dart';

class NewCollectionScreen extends StatefulWidget {
  const NewCollectionScreen({super.key});

  @override
  State<NewCollectionScreen> createState() => _NewCollectionScreenState();
}

class _NewCollectionScreenState extends State<NewCollectionScreen> {
  int _selectedIconIndex = 1; // Default to sparkle

  final List<IconData> _icons = [
    Icons.folder_outlined,
    Icons.auto_awesome_outlined, // Sparkles
    Icons.spa_outlined, // Leaf
    Icons.self_improvement, // Meditation
    Icons.psychology_outlined, // Head/Mind
    Icons.lightbulb_outline,
    Icons.menu_book_rounded,
    Icons.favorite_border,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "New Collection",
          style: GoogleFonts.outfit(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "COLLECTION NAME",
                style: GoogleFonts.outfit(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.grey,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Name your collection...",
                  hintStyle: GoogleFonts.dmSerifDisplay(
                    fontSize: 24,
                    color: Colors.grey[300],
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface), // Active color
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 48),
              Text(
                "CHOOSE AN ICON",
                style: GoogleFonts.outfit(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: List.generate(_icons.length, (index) {
                  final isSelected = _selectedIconIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIconIndex = index),
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: isSelected ? Theme.of(context).cardTheme.color : Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: isSelected ? Border.all(color: Theme.of(context).dividerColor.withOpacity(0.2)) : null,
                        boxShadow: isSelected ? [
                           BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                        ] : null,
                      ),
                      child: Icon(
                        _icons[index],
                        color: Theme.of(context).colorScheme.primary,
                        size: 24,
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                     // Navigate to success state or next step
                     Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(builder: (context) => const CollectionCreatedScreen())
                     );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary, // Dark brown/black
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Create Collection",
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionCreatedScreen extends StatelessWidget {
  const CollectionCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.transparent), // Hidden back for visual spacing/consistency if needed or just empty
          onPressed: () {}, 
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.grey),
            onPressed: () {},
          )
        ],
        title: Text(
            "Favorites", // Image shows "Favorites" ghost text? Or is it main title? Image 3 shows "Favorites", "Collection Created!". 
                        // Wait, Image 3 has "Favorites" at top left but faded. It seems like the collection name.
                        // Let's assume it's the title of the created collection page initially.
            style: GoogleFonts.dmSerifDisplay(color: Colors.grey[300], fontSize: 32)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    shape: BoxShape.circle,
                     boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ]
                  ),
                  child: Center(
                    child: Icon(Icons.check, size: 48, color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "Collection Created!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "You can now start adding your favorite quotes to this folder.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                       // Go to collection (which is currently empty)
                       Navigator.pushReplacement(
                         context, 
                         MaterialPageRoute(builder: (context) => const EmptyCollectionScreen())
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Go to Collection",
                       style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                 SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const AddToCollectionScreen()),
                       );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.3)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Add Quotes",
                       style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
        ),
      ),
    );
  }
}

class EmptyCollectionScreen extends StatelessWidget {
  const EmptyCollectionScreen({super.key});

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
           "New Collection",
           style: GoogleFonts.outfit(color: Theme.of(context).colorScheme.onSurface, fontSize: 18, fontWeight: FontWeight.w500),
         ),
         actions: [
           IconButton(icon: Icon(Icons.more_horiz, color: Theme.of(context).colorScheme.onSurface), onPressed: (){})
         ],
         centerTitle: true,
         backgroundColor: Colors.transparent,
         elevation: 0,
       ),
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.all(32.0),
           child: Column(
             children: [
               const Spacer(),
               // Empty state icon (Document outline)
               Opacity(
                 opacity: 0.1,
                 child: Icon(Icons.description_outlined, size: 200, color: Colors.grey), // Placeholder for custom empty graphic
               ),
               const SizedBox(height: 32),
               Text(
                 "This collection is empty",
                 textAlign: TextAlign.center,
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
               ),
               const SizedBox(height: 16),
               Text(
                 "Start by adding some of your favorite quotes here.",
                 textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
               ),
               const SizedBox(height: 48),
                SizedBox(
                  height: 56,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const AddToCollectionScreen()),
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Add First Quote",
                       style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
               const Spacer(flex: 2),
             ],
           ),
         ),
       ),
    );
  }
}
