import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:thirdeye/presentation/screens/ch_articles/suggestion.dart';

import '../../ch_widgets/items.dart';
import '../../shared/styles/text_styles.dart';
import 'feed.dart';
import 'hot.dart';
import 'most_read.dart';


class ChildrenArticlesScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(IconBroken.Search),
              onPressed: () {
                // add your code here
              },
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.message),
            onPressed: () {
              // add your code here
            },
          ),
        ],
      ),
      body:  DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child:  TabBar(
                isScrollable: true,
                physics: const ClampingScrollPhysics(),
                labelColor: Colors.white,
                labelStyle: infoCardStyle,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                tabs:   [
                  tabWidget('Feed'),
                  tabWidget('Hot'),
                  tabWidget('Most Read'),
                  tabWidget('Recommended'),

                ],

              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  FeedArticles(),
                  HotArticles(),
                  MostReadArticles(),
                  SuggestionArticles(),],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
