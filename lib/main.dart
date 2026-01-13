import 'package:daily_quote_home/core/theme/app_theme.dart';
import 'package:daily_quote_home/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:daily_quote_home/core/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:daily_quote_home/features/quote/data/datasources/quote_remote_datasource.dart';
import 'package:daily_quote_home/features/quote/data/repositories/quote_repository_impl.dart';
import 'package:daily_quote_home/features/quote/presentation/providers/quote_provider.dart';

void main() {
  runApp(const DailyQuoteApp());
}

class DailyQuoteApp extends StatelessWidget {
  const DailyQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create: (_) => QuoteProvider(
            repository: QuoteRepositoryImpl(
              remoteDataSource: QuoteRemoteDataSourceImpl(
                client: http.Client(),
              ),
            ),
          )..fetchRandomQuote(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Daily Quote Home',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
