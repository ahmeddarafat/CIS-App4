import '../../data/repository/quotes_repo.dart';
import 'package:flutter/material.dart';

import '../../data/model/quote_model.dart';

class ChooseViewModel {
  final QuotesRepo _repo = QuotesRepo();
  List<QuoteModel> quotes = [];

  void chooseRandomQuote(String title, BuildContext context, Widget nextView) {
    _repo.getQuote(title).then(
      (value) {
        quotes.add(value);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return nextView;
            },
          ),
        );
      },
    );
    quotes.clear();
  }

  void chooseTenRandomQuotes(
      String title, BuildContext context, Widget nextView) {
    _repo.getQuotesList(title).then(
      (value) {
        quotes.addAll(value);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return nextView;
            },
          ),
        );
      },
    );
    quotes.clear();
  }
}
