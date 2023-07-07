import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cashe_helper.dart';
import '../../shared/styles/colors.dart';
import '../get_started.dart';


class BoardingModel
{
   final String image;
   final String title;
   final String body;
  BoardingModel({
  required this.image,
  required this.title,
  required this.body,});

}

class onBoardingScreen extends StatefulWidget {

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var pageController = PageController();
  bool isLastPage = false;

  void submit()
  {
    CacheHelper.saveData(kay: 'onBoarding', value: true).then((value)
        {
          if(value!)
            {
              navigatePushAndRemoveUntil(context,GetStartedScreen());
            }
        }

    );


  }

  List<BoardingModel> boardingScreens = [
    BoardingModel(
        image: 'assets/images/b1.png',
        title: 'Welcome to our Baby Curing app!',
        body: "Our app is designed to help new parents take care of their baby and provide them with the information and support they need during the early months of their baby's life."),
    BoardingModel(
        image: 'assets/images/b2.png',
        title: 'Our app features',
        body: 'a variety of tools and resources that are designed to make baby care easier and more manageable. '),
    BoardingModel(
        image: 'assets/images/b4.png',
        title: 'Our Mission',
        body: 'Empowering parents for better baby care and development.'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (context, index) =>item(boardingScreens[index]),
                itemCount:boardingScreens.length ,
                onPageChanged: (int index)
                {
                  if( index == boardingScreens.length-1)
                    {
                      setState(() {
                        isLastPage = true;
                      });
                    }
                  else
                    {
                      setState(() {
                        isLastPage = false;
                      });
                    }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defaultTextButton(
                    function: submit,
                    text: 'Skip'
                ),
                SmoothPageIndicator(
                    controller: pageController,
                    count: boardingScreens.length,
                    effect:   ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: mainColor,
                      dotHeight: 16,
                      dotWidth: 16,
                      expansionFactor: 4,
                      spacing: 5,
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    if(isLastPage)
                    {
                      submit();

                    }
                    else
                    {
                      pageController.nextPage(duration: const
                      Duration(
                        milliseconds: 750,
                      ),
                        curve: Curves.fastLinearToSlowEaseIn,);
                    }
                  },
                  child:Container(
                    padding: const EdgeInsets.all(20),
                    decoration:  BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.teal,
                      size: 28,
                    ) ,

                  ) ,
                ),

              ],
            )
          ],
        ),
      )
    );
  }

  Widget item(BoardingModel model)=> Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 400,
          height: 400,
          child: Image.asset(
            model.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 20,),
       Text(
        model.title,
         textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 20,),
       Text(
        model.body,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          height: 1.5,
          fontSize: 16,
        ),
      ),
    ],
  );
}
