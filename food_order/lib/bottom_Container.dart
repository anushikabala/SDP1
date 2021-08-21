import 'package:flutter/material.dart';

import 'main.dart';
class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final Function()? onTap;
  BottomContainer({required this.onTap,required this.image, required this.name, required this.price});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
          color: Color(getColorHexFromStr('#fdebba')),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Color(getColorHexFromStr('#fdebba')),
              backgroundImage: NetworkImage(image),
            ),
            ListTile(
              leading: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              trailing: Text(
                "\₹ $price",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    size: 20.0,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class MyButton extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  MyButton({
    required this.onPressed,
    required this.text,
  });

  @override
  _MyButtonState createState() => _MyButtonState();
}
class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(04),
      ),
      padding: EdgeInsets.all(0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(getColorHexFromStr('#fdebba')),
              Color(getColorHexFromStr('#fdebba')),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(04),
        ),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: TextStyle(
                color: Color(getColorHexFromStr('#fdebba')),
            ),
          ),
        ),
      ),
    );
  }
}
