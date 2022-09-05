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
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                news.imageLink,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
                errorBuilder: (ctx, url, error) => const Center(child: Text('error while loading picture')),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: const Color.fromRGBO(224, 224, 224, 0.6),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      news.title,
                      textAlign: TextAlign.right,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: const Color.fromRGBO(1, 1, 1, 0.1),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          news.content,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
