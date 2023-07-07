import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/styles/text_styles.dart';

class HomeScreenBar extends StatelessWidget {
  HomeScreenBar({super.key});
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: h *.062),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Builder(
              builder: (context) {
                 return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                    child: Container(
                      padding:  EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow:  [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6.r
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child:  Icon(
                        FontAwesomeIcons.barsStaggered,
                        size: 30.sp,

                      ),
                    )

                );
              }
            ),
          ),
          SizedBox(width: w*.025,),
          Text('Home', style: headline26.copyWith(color: Colors.black),),
          const Spacer(),
          InkWell(
              onTap: () {},
              child: Container(
                padding:  EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:  [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6.r
                    )
                  ],
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child:  Icon(
                  CupertinoIcons.search,
                  size: 26.sp,
                ),
              )

          ),
           SizedBox(
            width: w*.025,
          ),
          Padding(
            padding:  EdgeInsets.only(right: 20.sp),
            child: InkWell(
                onTap: () {},
                child: Container(
                  padding:  EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow:  [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6.r
                      )
                    ],
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child:  Icon(
                    Icons.notifications,
                    size: 26.sp,
                  ),
                )

            ),
          ),
        ],

      ),
    );
  }
}
