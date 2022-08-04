import 'package:flutter/material.dart';
import '../../view_models/news_detailes_view_model.dart';

class NewsDetailesView extends StatelessWidget {
  const NewsDetailesView({Key? key, required this.newsDetailesViewModel})
      : super(key: key);
  final NewsDetailesViewModel newsDetailesViewModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(newsDetailesViewModel.title.toString())),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(newsDetailesViewModel.id.toString()),
              SizedBox(height: 10),
              Text(newsDetailesViewModel.userId.toString()),
              SizedBox(height: 10),
              Text(newsDetailesViewModel.title.toString()),
              SizedBox(height: 10),
              Text(newsDetailesViewModel.body.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
