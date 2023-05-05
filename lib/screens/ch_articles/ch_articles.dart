import 'package:flutter/material.dart';
import 'package:thirdeye/screens/ch_articles/feed.dart';
import 'package:thirdeye/screens/ch_articles/hot.dart';
import 'package:thirdeye/screens/ch_articles/most_read.dart';
import 'package:thirdeye/screens/ch_articles/suggestion.dart';
import 'package:thirdeye/screens/ch_articles/top.dart';

import '../../shared/components/components.dart';

class ChildrenArticlesScreen extends StatelessWidget {
  const ChildrenArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return  DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: Container(
            decoration: const BoxDecoration(

            ),
            child: defaultForm(
                controller: searchController,
                KBtype: TextInputType.text,
                validate: (String val) {
                  if (val?.isEmpty == true) {
                    return 'Search must not be  empty';
                  }
                  return null;
                },
                label: 'Search',
                prefix: Icons.search
            ),
          ),
          bottom:  const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Feed',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text('Hot',

                  style: TextStyle(color: Colors.black),
                ),

              ),
              Tab(
                child: Text('Top',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text('Most Read',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text('For You',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],

          ),
        ),
        body:  const TabBarView(
          children: [
            FeedArticles(),
            HotArticles(),
            TopArticles(),
            MostReadArticles(),
            SuggestionArticles(),
          ]
        ,

        ),
      ),
    );
  }
}
