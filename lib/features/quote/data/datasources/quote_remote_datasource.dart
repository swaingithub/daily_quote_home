import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../models/quote_model.dart';

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  final http.Client client;

  QuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await client.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.randomQuoteEndpoint}'),
    );

    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load quote');
    }
  }
}
