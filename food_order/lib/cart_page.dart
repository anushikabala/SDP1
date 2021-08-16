import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'main.dart';

class CartPage extends StatelessWidget {
  @override
  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required Function()? onTap,
    required int quantity,
  }) {
    return Row(
      children: [
        Container(
          width: 170,
          height: 170,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Gst added",
                        style: TextStyle(color: Colors.black87),
                      ),
                      Text(
                        "\$ $price",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "$quantity",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: onTap,
                )
              ],
            )),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    Myprovider provider = Provider.of<Myprovider>(context);
    int total = provider.totalprice();
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        height: 63,
        decoration: BoxDecoration(
            color: Color(getColorHexFromStr('#fbcd7a')),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\₹ $total",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Check Out",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      appBar: AppBar(

        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => home()));
          },
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(itemCount: provider.cartList.length,
        itemBuilder: (ctx,index) {
        provider.getDeleteIndex(index);
          return cartItem(
            onTap: () {
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        }
      ),

    );
  }
}
