import 'package:flutter/material.dart';
import '../../ch_widgets/items.dart';


class FeedArticles extends StatelessWidget {
  const FeedArticles({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 5,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ArticleItem(context);
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
