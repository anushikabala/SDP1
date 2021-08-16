import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order/provider.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';
import 'home.dart';
import 'main.dart';

class DetailPage extends StatefulWidget
{
  final String image;
  final int price;
  final String name;
  final String des;
  DetailPage({required this.image,required this.name,required this.price,required this.des});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    Myprovider provider = Provider.of<Myprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => home()));
          },
        ),
      ),
      body: Container(

        child: Column(
          children: [
            Expanded(
              child: Container(
                child: CircleAvatar(
                  radius: 110,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(getColorHexFromStr('#fdebba')),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 40, color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Gst added",
                      style: TextStyle(color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${widget.price * quantity}",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        )
                      ],
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.des,
                      style: TextStyle(color: Colors.black87),
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Color(getColorHexFromStr('#fbcd7a')),
                        onPressed: () {
                          provider.addToCart(
                            image: widget.image,
                            name: widget.name,
                            price: widget.price,
                            quantity: quantity,
                          );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => CartPage(),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.black87,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Add to Cart",
                              style: TextStyle(fontSize: 20, color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
