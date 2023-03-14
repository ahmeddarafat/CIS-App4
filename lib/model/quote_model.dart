class QuoteModel {
  final String anime;
  final String character;
  final String quote;

  QuoteModel({
    required this.anime,
    required this.character,
    required this.quote,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      anime: json["anime"] ?? "Unknown",
      character: json["character"] ?? "Unknown",
      quote: json["quote"] ?? "Unknown",
    );
  }

  Map<String, String> toJson() {
    return {
      "anime": anime,
      "character": character,
      "quote": quote,
    };
  }
}
