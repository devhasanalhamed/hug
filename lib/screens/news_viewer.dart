import 'package:flutter/material.dart';
import '../models/news.dart';

import '../providers/dummy_data.dart';

class NewsViewer extends StatefulWidget {
  static String routeName = 'news_viewer';
  const NewsViewer({Key? key}) : super(key: key);

  @override
  _NewsViewerState createState() => _NewsViewerState();
}

class _NewsViewerState extends State<NewsViewer> {
  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as NewsModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                news.imageLink,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  color: const Color.fromRGBO(1, 1, 1, 0.6),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    news.title,
                    textAlign: TextAlign.right,
                    softWrap: true,
                    style: const TextStyle(
                      color: Color.fromRGBO(224, 220, 220, 1.0),
                    ),
                  ),
                ),
                Container(
                  height: news.content.length.toDouble() + 30,
                  color: const Color.fromRGBO(1, 1, 1, 0.1),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        news.content,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
