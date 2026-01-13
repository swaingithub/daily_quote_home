import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel({
    required super.content,
    required super.author,
    required super.id,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      content: json['quote'] as String,
      author: json['author'] as String,
      id: json['id'].toString(),
    );
  }
}
