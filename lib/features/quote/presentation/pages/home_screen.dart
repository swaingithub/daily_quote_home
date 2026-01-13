import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Consumer<QuoteProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (provider.error != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.error!.contains('SocketException')
                            ? 'No internet connection'
                            : 'Something went wrong',
                        style: GoogleFonts.outfit(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => provider.fetchRandomQuote(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              final quote = provider.quote;
              if (quote == null) {
                return const Center(child: Text("No quote available"));
              }

              return Column(
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
                  SingleChildScrollView(
                    child: Text(
                      "“${quote.content}”",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: quote.content.length > 100 ? 32 : 42,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    quote.author.toUpperCase(),
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
                        icon: const Icon(Icons.favorite_border, size: 28),
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 32),
                      IconButton(
                        icon: const Icon(Icons.refresh, size: 28),
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () => provider.fetchRandomQuote(),
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
                  const SizedBox(height: 48),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
