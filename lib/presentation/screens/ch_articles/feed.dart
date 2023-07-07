import 'package:flutter/material.dart';
import 'package:thirdeye/presentation/shared/components/components.dart';
import '../../ch_widgets/items.dart';
import '../../shared/components/constants.dart';
import '../../used_items/post_item.dart';
import '../ch_doctor/cp_doctor.dart';


class FeedArticles extends StatelessWidget {
  const FeedArticles({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 1,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return PostItem(
                  onTab: ()
                  {
                    navigateTo(context, DoctorProfile());
                  },
                  doctorName: 'Dr Mohamed Ramadan',
                  postDate: '6 june 2023',
                  postTitle: 'Infants are vulnerable to various health risks'
                      ' due to their underdeveloped immune systems. Regular'
                      ' check-ups with a pediatrician and timely ',
                  imagePath: img+"e2.jpg", onTabLike: () {  }, onTabComment: () {  }, onTabSave: () {  },
                );

              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
            ),
          ],
        ),
      ),
    );
  }
}
