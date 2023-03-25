import 'home_view.dart';
import '../viewmodel/choose_viewmodel.dart';
import 'package:flutter/material.dart';


class ChooseView extends StatefulWidget {
  const ChooseView({super.key});

  @override
  State<ChooseView> createState() => _ChooseViewState();
}

class _ChooseViewState extends State<ChooseView> {
  late final TextEditingController _controller;

  final ChooseViewModel _viewModel = ChooseViewModel();

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
                    _viewModel.chooseRandomQuote(
                      _controller.text,
                      context,
                      HomeView(quotes: _viewModel.quotes),
                    );
                  },
                  child: const Text("Random Quote")),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    _viewModel.chooseTenRandomQuotes(
                      _controller.text,
                      context,
                      HomeView(quotes: _viewModel.quotes),
                    );
                  },
                  child: const Text("Random 10 Quotes")),
            ],
          ),
        ),
      ),
    );
  }
}
