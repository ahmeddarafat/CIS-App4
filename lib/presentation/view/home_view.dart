import '../../data/model/quote_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final List<QuoteModel> quotes;
  const HomeView({super.key, required this.quotes});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CIS App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          itemCount: widget.quotes.length,
          itemBuilder: (BuildContext context, int index) {
            if (widget.quotes.isEmpty) {
              return const Center(
                child: Text("No quotes"),
              );
            } else {
              return QuoteWidget(quote: widget.quotes[index]);
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 50,
              child: Divider(
                height: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuoteWidget extends StatelessWidget {
  final QuoteModel quote;
  const QuoteWidget({
    super.key,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(quote.character,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            quote.quote,
            style: const TextStyle(fontSize: 17,color: Colors.pinkAccent),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              quote.anime,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
