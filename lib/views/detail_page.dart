import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final String type;
  final String title;
  final String imgUrl;
  final String summary;
  final String newsUrl;

  const DetailPage({
    super.key,
    required this.type,
    required this.title,
    required this.imgUrl,
    required this.summary,
    required this.newsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${type.toUpperCase()} DETAIL'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        children: [
          Image.network(imgUrl),
          const SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(summary),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await launchUrl(Uri.parse(newsUrl));
        },
        label: const Text('See More..'),
        icon: const Icon(Icons.travel_explore),
      ),
    );
  }
}
