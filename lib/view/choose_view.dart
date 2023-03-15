import 'dart:developer';

import 'package:cis_app4/view/home_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/quote_model.dart';
import '../netwrok/dio_helper.dart';
import '../netwrok/end_points.dart';

class ChooseView extends StatefulWidget {
  const ChooseView({super.key});

  @override
  State<ChooseView> createState() => _ChooseViewState();
}

class _ChooseViewState extends State<ChooseView> {
  late final TextEditingController _controller;

  List<QuoteModel> quotes = [];
  Future<void> _getQuote([String? anime]) async {
    final Response response;
    if (anime == null || anime.isEmpty) {
      response = await DioHelper.getData(url: EndPoints.random);
    } else {
      response = await DioHelper.getData(
          url: EndPoints.randomByAnime, query: {"title": anime});
    }
    quotes.add(QuoteModel.fromJson(response.data));
  }

  Future<void> _getQuotes([String? anime]) async {
    final Response response;
    if (anime == null || anime.isEmpty) {
      response = await DioHelper.getData(url: EndPoints.quotes);
    } else {
      response = await DioHelper.getData(
          url: EndPoints.quotesByAnime, query: {"title": anime});
    }
    response.data.forEach((e){
      quotes.add(QuoteModel.fromJson(e));
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CIS App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controller,
                decoration:
                    const InputDecoration(hintText: "write anime, ex: naruto"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    debugPrint(_controller.text);
                    _getQuote(_controller.text).then(
                      (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return HomeView(quotes: quotes);
                            },
                          ),
                        );
                      },
                    );
                    quotes.clear();
                  },
                  child: const Text("Random Quote")),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    debugPrint(_controller.text);
                    _getQuotes(_controller.text).then(
                      (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return HomeView(quotes: quotes);
                            },
                          ),
                        );
                      },
                    );
                    quotes.clear();
                  },
                  child: const Text("Random 10 Quotes")),
            ],
          ),
        ),
      ),
    );
  }
}
