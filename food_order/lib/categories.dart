import 'package:flutter/material.dart';
import 'package:food_order/food_categories_modle.dart';
import 'package:food_order/home.dart';

import 'bottom_Container.dart';
import 'details_page.dart';
// ignore: must_be_immutable
class Categories extends StatelessWidget{
  List<FoodCategoriesModle> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        leading: IconButton(
          icon:Icon(Icons.arrow_back),
          onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> home()));
          },),

      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0,left: 9.0,right: 9.0),
        child: GridView.count(
            shrinkWrap: false,
            primary: false,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: list
                .map(
                  (e) => BottomContainer
                    (

                      image: e.image,
                      name: e.name,
                      price: e.price,
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context)=> DetailPage(
                                image: e.image,
                                price: e.price,
                                des: e.des,
                                name: e.name,

                              )));
                    },
                  ),
            ).toList()
        ),
      ),
    );
  }
}