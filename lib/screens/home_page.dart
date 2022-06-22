import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/news.dart';

import '../providers/dummy_data.dart';
import '../widgets/appbar/my_appbar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>(); //allow to open drawer
  List<NewsModel> news = AppStructure().newsElement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: const MyAppBar(pageTitle:'الرئيسية'),
      // endDrawer: const MyAppDrawer(),
      body: Stack(
        children: [
          Container(
            // color: const Color.fromRGBO(245, 245, 245, 1),//Theme.of(context).colorScheme.primary,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(245, 245, 245, 1.0).withOpacity(1),
                  const Color.fromRGBO(245, 245, 245, 1.0).withOpacity(1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: const [0, 1],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15,),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white30,
                    Colors.white10,
                  ]
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (ctx, index, realIndex) => Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(news[index].imageLink,fit: BoxFit.cover,width: double.infinity,)),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                news[index].title,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0
                                ),
                              ),
                            ),
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: const BorderRadius.all(Radius.circular(15))
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "جديد",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    children: AppStructure().homePageElement.map((element){
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius:  const BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                        ),
                        child: InkWell(
                          onTap: () => {
                            Navigator.pushNamed(context, element.routeName)
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FaIcon(
                                element.icon,
                                size: 35,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text(
                                element.name,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ],
                          ),
                          // Column( //stack
                          //   children: [
                              // Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       color: Theme.of(context).colorScheme.primary
                              //     ),
                              //     borderRadius: const BorderRadius.all(
                              //       Radius.circular(10.0),
                              //     ),
                              //     gradient: LinearGradient(
                              //         begin: Alignment.topLeft,
                              //         end: Alignment.bottomRight,
                              //         colors: [
                              //           // Color.fromRGBO(10, 33, 76, 0.91),
                              //           // Color.fromRGBO(10, 33, 76, 0.92),
                              //           // Color.fromRGBO(10, 33, 76, 0.93),
                              //           // Color.fromRGBO(10, 33, 76, 0.94),
                              //           // Color.fromRGBO(10, 33, 76, 0.95),
                              //           // Color.fromRGBO(10, 33, 76, 0.96),
                              //           // Color.fromRGBO(10, 33, 76, 0.97),
                              //           // Color.fromRGBO(10, 33, 76, 0.98),
                              //           // Color.fromRGBO(10, 33, 76, 0.99),
                              //           // Color.fromRGBO(10, 33, 76, 1.0),
                              //           Theme.of(context).colorScheme.primary,
                              //           Theme.of(context).colorScheme.primary,
                              //         ]
                              //     ),
                              //   ),
                              // ),
                              // Row(
                              //   children: [
                              //     // ClipRRect(
                              //     //   borderRadius: const BorderRadius.all(
                              //     //     Radius.circular(10.0),
                              //     //   ),
                              //     //   child: Image.asset(
                              //     //     element.imageLink,
                              //     //     fit: BoxFit.fill,
                              //     //   ),
                              //     // ),
                              //     if (!_gridView) Padding(
                              //       padding: const EdgeInsets.only(
                              //         left: 20,
                              //       ),
                              //       child: Icon(
                              //         Icons.arrow_back_ios,
                              //         color: Theme.of(context).colorScheme.secondary,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // Positioned(
                              //   right: 20,
                              //   bottom: 20,
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       Text(
                              //         element.name,
                              //         style: Theme.of(context).textTheme.subtitle1,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // const Spacer(),
                              // FaIcon(
                              //   element.icon,
                              //   size: 50,
                              //   color: Theme.of(context).colorScheme.secondary,
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // Text(
                              //   element.name,
                              //   style: TextStyle(
                              //     color: Theme.of(context).colorScheme.secondary,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 5,
                              // ),
                              // Container(
                              //   height: 5,
                              //   decoration: BoxDecoration(
                              //     borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                              //     color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                              //   ),
                              //   width: double.infinity,
                              // )
                          //   ],
                          // ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

