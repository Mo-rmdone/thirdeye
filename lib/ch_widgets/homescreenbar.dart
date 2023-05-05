import 'package:flutter/material.dart';

class HomeScreenBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Builder(
              builder: (context) {
                return InkWell(
                    onTap:
                        ()
                    {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.sort_outlined,
                        size: 30,

                      ),
                    )

                );
              }
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.search,
                  size: 26,
                ),
              )

          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.notifications,
                    size: 26,
                  ),
                )

            ),
          ),

        ],

      ),
    );
  }
}
