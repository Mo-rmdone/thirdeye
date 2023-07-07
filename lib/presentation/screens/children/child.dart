import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class ChildScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('your Children'),
      ),
      body:  Center(
        child: childBuilder(),

      ),

    );
  }
}


Widget child() => Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Row(
    children: [
      const CircleAvatar(
        radius: 40,
        child: Text(
          'id',),

      ),
      const SizedBox(

        width: 20,

      ),
      Expanded(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  const [
            Text(
              'name',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),

            ),
            Text(
              'info',
              style: TextStyle(
                color: Colors.grey,
              ),

            ),
          ],

        ),

      ),
      const SizedBox(

        width: 20,

      ),
      IconButton(
          icon: const Icon(Icons.check_box,
            color: Colors.green,
          ), onPressed: () {  },),
      IconButton(
          onPressed: ()
          {
          },

          icon: const Icon(

            Icons.archive,

            color: Colors.grey,

          )),
    ],
  ),);
Widget childBuilder () => ConditionalBuilder(
  condition:true,
  builder: (BuildContext context) => ListView.separated(
      itemBuilder: (context, index) => child(),
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
      itemCount: 3),
  fallback: (BuildContext context) => const Center(
    child: CircularProgressIndicator()
  ),


);

