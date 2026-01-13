import 'package:flutter/material.dart';
import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';

class QuoteProvider with ChangeNotifier {
  final QuoteRepository repository;
  Quote? _quote;
  bool _isLoading = false;
  String? _error;

  QuoteProvider({required this.repository});

  Quote? get quote => _quote;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRandomQuote() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _quote = await repository.getRandomQuote();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
