import 'package:dgfhuss/widgets/appbar/my_appbar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/news.dart';

import '../screens/news_viewer.dart';

class NewsScreen extends StatefulWidget {
  static String routeName = 'news_screen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsProvider>(context).newsList;
    return Scaffold(
      appBar: const MyAppBar(pageTitle: 'الأخبار'),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, NewsViewer.routeName,arguments: news[i]);
                },
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Image.network(
                          news[i].imageLink,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, url, error) => Center(child: Text('error while loading picture')),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        child: Container(
                          color: const Color.fromRGBO(1, 1, 1, 0.65),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      news[i].title,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              Text(
                                news[i].content,
                                textAlign: TextAlign.right,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          },
      ),
    );
  }
}
