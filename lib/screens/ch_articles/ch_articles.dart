import 'package:flutter/material.dart';
import 'package:thirdeye/screens/ch_articles/feed.dart';
import 'package:thirdeye/screens/ch_articles/hot.dart';
import 'package:thirdeye/screens/ch_articles/most_read.dart';
import 'package:thirdeye/screens/ch_articles/suggestion.dart';
import 'package:thirdeye/screens/ch_articles/top.dart';
import '../../ch_widgets/items.dart';


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
              icon: const Icon(Icons.search),
              onPressed: () {
                // add your code here
              },
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              // add your code here
            },
          ),
        ],
      ),
      body:  DefaultTabController(
        length: 5,
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child:  TabBar(
                isScrollable: true,
                physics: const ClampingScrollPhysics(),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black, width:1)

                ),
                tabs:   [
                  tabWidget('Following'),
                  tabWidget('Following'),
                  tabWidget('Following'),
                  tabWidget('Following'),
                  tabWidget('Following'),

                ],

              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  FeedArticles(),
                  HotArticles(),
                  TopArticles(),
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
