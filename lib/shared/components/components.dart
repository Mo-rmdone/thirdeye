import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';



Widget defaultButton ({
  double width = double.infinity,
  Color background = Colors.teal,
  double radius = 20.0,
  String text = "text",
  bool isUpper = true,
  required VoidCallback function,
}
)=> Container(
    width: width,
  height: 40,
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius)
  ),

    child: MaterialButton
      (
            onPressed: function,

      child:  Text
      (
        isUpper ? text.toUpperCase() : text ,
          style:
           TextStyle(
          color: mainColor
          ),
      ),

        ),
);

Widget defaultTextButton(
{
  required VoidCallback function,
  String text = "text",

}) =>TextButton(onPressed: function, child: Text(text.toUpperCase()),);

Widget defaultForm({
  required TextEditingController controller,
  required TextInputType KBtype,
  Function (String)? onSubmit,
  Function (String)? onchange,
  required Function validate,
  required String label,
  required IconData prefix,
  VoidCallback? onTap,
  VoidCallback ? suffPressed,
  IconData? suffix,
  bool isobscureText = false,


})
=>TextFormField(
  controller: controller,
  obscureText: isobscureText,
  keyboardType:KBtype ,
  onFieldSubmitted: onSubmit,
  onChanged: onchange,
  onTap: onTap ,
  decoration:  InputDecoration(
  prefixIcon: Icon(prefix),
  suffixIcon: IconButton(
        onPressed: suffPressed,
        icon:Icon(suffix)) ,
  labelText: label,
  filled: true,
  fillColor: Colors.white,


  ),
  validator: (value){
    return validate!(value);
},
);

Widget defaultIconButton ({required VoidCallback function, required IconData icon }) => IconButton(
    onPressed: function,
    icon: Icon(icon));

Widget defaultAvatarButton() => CircleAvatar();
Widget myDivider() => Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


void navigateTo (context, Widget)=> Navigator.push(context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
);

void navigatePushAndRemoveUntil (context, Widget)=> Navigator.pushAndRemoveUntil(context,
  MaterialPageRoute(
    builder: (context) => Widget,),
      (route)
    {
      return false;
    }
);

void showToast ({required String message, required ToastStatus state })=>Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: toastColor(state),
    textColor: Colors.black,
    fontSize: 16.0
);


enum ToastStatus {SUCCESS, ERORR, WARNING}
Color toastColor (ToastStatus state)
{
  Color color;
   switch (state)
   {
     case ToastStatus.SUCCESS:
       color = Colors.green;
       break;
     case ToastStatus.WARNING:
       color = Colors.yellowAccent;
       break;
     case ToastStatus.ERORR:
       color = Colors.red;
       break;
   }
  return color;
}
Widget buildArticleItem(article,context) => InkWell(

  onTap: (){},
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

        children:

        [

          Container(

            width: 120,

            height: 120,

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0,),

                image:   DecorationImage(

                  image: NetworkImage('${article['urlToImage']}'),

                  fit: BoxFit.cover,

                )

            ),

          ),

          const SizedBox(

            width: 20,

          ),

          Expanded(

            child: Container(

              height: 120,

              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,

                crossAxisAlignment: CrossAxisAlignment.start,

                children:   [

                  Expanded(

                    child: Text(

                      "${article['title']}",

                      style: Theme.of(context).textTheme.bodyLarge,

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                    ),

                  ),

                  Text(

                    "${article['publishedAt']}",

                    style: Theme.of(context).textTheme.bodySmall,

                  ),

                ],

              ),

            ),

          )





        ]





    ),

  ),
);
Widget articleItemBuilder (list,context,{isSearch = false}) => ConditionalBuilder(
  condition: list.length>0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index],context) ,
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,
  ),
  fallback: (context) => isSearch ? Container(): const Center(child: CircularProgressIndicator()),
);