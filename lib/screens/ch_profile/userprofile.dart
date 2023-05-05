import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';

class ChildrenProfileScreen extends StatelessWidget {
  const ChildrenProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('My Profile',
          style: Theme.of(context).textTheme.titleLarge ,
        ),
        centerTitle: true,
        backgroundColor:mainColor ,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),

                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                    AssetImage('assets/images/e1.jpg'),
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mohamed Ramadan',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white
                        ),
                      ),
                      Text('Doctor and Blogger',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade300,
                              fontSize: 16
                          )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ExpansionTile(
                    title: const Text('Main info'),
                    leading: const CircleAvatar(
                      child: Image(image: AssetImage('assets/images/profile.gif')),
                    ) ,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 20 ,

                              child: IconButton(
                                onPressed: (){},
                                color:Colors.black ,
                                icon: const Icon(Icons.edit,),),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 20 ,

                              child: IconButton(
                                onPressed: (){},
                                color:Colors.black ,
                                icon: const Icon(Icons.edit,),),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 20 ,

                              child: IconButton(
                                onPressed: (){},
                                color:Colors.black ,
                                icon: const Icon(Icons.edit,),),
                            ),
                          ),

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 20 ,

                              child: IconButton(
                                onPressed: (){},
                                color:Colors.black ,
                                icon: const Icon(Icons.edit,),),
                            ),
                          ),

                        ],
                      ),
                    ],


                  ),
                  const SizedBox(height:20 ,),
                  ExpansionTile(
                    title: const Text('Children'),
                    leading: const CircleAvatar(
                      child: Image(image: AssetImage('assets/images/baby.gif')),
                    ) ,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Bio : '),
                          const SizedBox(width: 10,),
                          const Text("Doctor"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                    ],


                  ),
                  const SizedBox(height:20 ,),
                  ExpansionTile(
                    title: const Text('Care Providers'),
                    leading: const CircleAvatar(
                      child: Image(image: AssetImage('assets/images/doctor.gif')),
                    ) ,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Bio : '),
                          const SizedBox(width: 10,),
                          const Text("Doctor"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:  [
                          const Text(' Name : '),
                          const SizedBox(width: 10,),
                          const Text("Moahmed Ramadan"),
                          const Spacer(),
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.edit))

                        ],
                      ),
                    ],


                  ),




                ],
              ) ,
            ),


          ],
        ),
      ),
    );
  }
}
