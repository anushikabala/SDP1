import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/cart_modle.dart';
import 'package:food_order/categories_modle.dart';
import 'package:food_order/foodModle.dart';
import 'package:food_order/food_categories_modle.dart';

class Myprovider extends ChangeNotifier {
  List<CategoriesM> burgerList = [];
  late CategoriesM burgerM;

  Future<void> getBurgerCategory() async {
    List<CategoriesM> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Category')
        .doc('0khwYCehf2gWnadlaIoK')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );

      newBurgerList.add(burgerM);
      burgerList = newBurgerList;
    });
  }

  get throwBurgerList {
    return burgerList;
  }

  //2//////////
  List<CategoriesM> drinksList = [];
  late CategoriesM drinksM;

  Future<void> getDrinksCategory() async {
    List<CategoriesM> newDrinksList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Category')
        .doc('0khwYCehf2gWnadlaIoK')
        .collection('Drinks')
        .get();
    querySnapshot.docs.forEach((element) {
      drinksM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      newDrinksList.add(drinksM);
      drinksList = newDrinksList;
    });
  }

  get throwDrinksList {
    return drinksList;
  }

  //////////3//////////
  List<CategoriesM> pizzaList = [];
  late CategoriesM pizzaM;

  Future<void> getPizzaCategory() async {
    List<CategoriesM> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Category')
        .doc('0khwYCehf2gWnadlaIoK')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );

      newPizzaList.add(pizzaM);
      pizzaList = newPizzaList;
    });
  }

  get throwPizzaList {
    return pizzaList;
  }

  //////////4///////////

  List<CategoriesM> momoList = [];
  late CategoriesM momoM;

  Future<void> getMomoCategory() async {
    List<CategoriesM> newMomoList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Category')
        .doc('0khwYCehf2gWnadlaIoK')
        .collection('Momo')
        .get();
    querySnapshot.docs.forEach((element) {
      momoM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      newMomoList.add(momoM);
      momoList = newMomoList;
    });
  }

  get throwMomoList {
    return momoList;
  }

  List<CategoriesM> biriyaniList = [];
  late CategoriesM biriyaniM;

  Future<void> getBiriyaniCategory() async {
    List<CategoriesM> newBiriyaniList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Category')
        .doc('0khwYCehf2gWnadlaIoK')
        .collection('biriyani')
        .get();
    querySnapshot.docs.forEach((element) {
      biriyaniM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      newBiriyaniList.add(biriyaniM);
      biriyaniList = newBiriyaniList;
    });
  }

  get throwBiriyaniList {
    return biriyaniList;
  }

  //////6////////////////////////////
  List<CategoriesM> saladList = [];
  late CategoriesM saladM;

  Future<void> getSaladCategory() async {
    List<CategoriesM> newSaladList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Category')
        .doc('0khwYCehf2gWnadlaIoK')
        .collection('Salad')
        .get();
    querySnapshot.docs.forEach((element) {
      saladM = CategoriesM(
        image: element.get('image') ?? '',
        name: element.get('name') ?? '',
      );
      newSaladList.add(saladM);
      saladList = newSaladList;
    });
  }

  get throwSaladList {
    return saladList;
  }

  ////////////// Single Food Item //////
  List<FoodModle> foodModleList = [];
  late FoodModle foodModle;

  Future<void> getFoodList() async {
    List<FoodModle> newfoodModleList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach((element) {
      foodModle = FoodModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price'],
          des: (element.data() as dynamic)['des']);
      print(foodModle.name);
      newfoodModleList.add(foodModle);
      foodModleList = newfoodModleList;
    });
  }

  get throwFoodModleList {
    return foodModleList;
  }

  ////////////burger categories list//////
  List<FoodCategoriesModle> burgerCategoriesList = [];
  late FoodCategoriesModle burgerCategoriesModle;

  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModle> newBurgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('2pkmdeOKJ6xPHGQeREvG')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price'],
          des: (element.data() as dynamic)['des']);
      newBurgerCategoriesList.add(burgerCategoriesModle);
      burgerCategoriesList = newBurgerCategoriesList;
    });
    print(burgerCategoriesModle.name);
  }

  get throwBurgerCategoriesList {
    return burgerCategoriesList;
  }

  ////////////pizza categories list//////
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  late FoodCategoriesModle pizzaCategoriesModle;

  Future<void> getPizzaCategoriesList() async {
    List<FoodCategoriesModle> newPizzaCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('2pkmdeOKJ6xPHGQeREvG')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price'],
          des: (element.data() as dynamic)['des']);
      newPizzaCategoriesList.add(pizzaCategoriesModle);
      pizzaCategoriesList = newPizzaCategoriesList;
    });
    print(pizzaCategoriesModle.name);
  }

  get throwPizzaCategoriesList {
    return pizzaCategoriesList;
  }

  ////////////Momo categories list//////
  List<FoodCategoriesModle> momoCategoriesList = [];
  late FoodCategoriesModle momoCategoriesModle;

  Future<void> getMomoCategoriesList() async {
    List<FoodCategoriesModle> newMomoCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('2pkmdeOKJ6xPHGQeREvG')
        .collection('Momo')
        .get();
    querySnapshot.docs.forEach((element) {
      momoCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price'],
          des: (element.data() as dynamic)['des']);
      newMomoCategoriesList.add(momoCategoriesModle);
      momoCategoriesList = newMomoCategoriesList;
    });
    print(momoCategoriesModle.name);
  }

  get throwMomoCategoriesList {
    return momoCategoriesList;
  }

  ////////////Salad categories list//////
  List<FoodCategoriesModle> saladCategoriesList = [];
  late FoodCategoriesModle saladCategoriesModle;

  Future<void> getSaladCategoriesList() async {
    List<FoodCategoriesModle> newSaladCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('2pkmdeOKJ6xPHGQeREvG')
        .collection('Salad')
        .get();
    querySnapshot.docs.forEach((element) {
      saladCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price'],
          des: (element.data() as dynamic)['des']);
      newSaladCategoriesList.add(saladCategoriesModle);
      saladCategoriesList = newSaladCategoriesList;
    });
    print(saladCategoriesModle.name);
  }

  get throwSaladCategoriesList {
    return saladCategoriesList;
  }

  ////////////Drinks categories list//////
  List<FoodCategoriesModle> drinksCategoriesList = [];
  late FoodCategoriesModle drinksCategoriesModle;

  Future<void> getDrinksCategoriesList() async {
    List<FoodCategoriesModle> newDrinksCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('2pkmdeOKJ6xPHGQeREvG')
        .collection('Drinks')
        .get();
    querySnapshot.docs.forEach((element) {
      drinksCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price'],
          des: (element.data() as dynamic)['des']);
      newDrinksCategoriesList.add(drinksCategoriesModle);
      drinksCategoriesList = newDrinksCategoriesList;
    });
    print(drinksCategoriesModle.name);
  }

  get throwDrinksCategoriesList {
    return drinksCategoriesList;
  }

  ////////////Biriyani categories list//////
  List<FoodCategoriesModle> biriyaniCategoriesList = [];
  late FoodCategoriesModle biriyaniCategoriesModle;

  Future<void> getBiriyaniCategoriesList() async {
    List<FoodCategoriesModle> newBiriyaniCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('foodcategories')
        .doc('2pkmdeOKJ6xPHGQeREvG')
        .collection('biriyani')
        .get();
    querySnapshot.docs.forEach((element) {
      biriyaniCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price'],
          des: (element.data() as dynamic)['des']);
      newBiriyaniCategoriesList.add(biriyaniCategoriesModle);
      biriyaniCategoriesList = newBiriyaniCategoriesList;
    });
    print(biriyaniCategoriesModle.name);
  }

  get throwBiriyaniCategoriesList {
    return biriyaniCategoriesList;
  }

  //////ADD TO CART /////////
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  late CartModle cartModle;

  void addToCart(
      {required String image,
      required String name,
      required int price,
      required int quantity}) {
    cartModle =
        CartModle(image: image, name: name, price: price, quantity: quantity
        );
    newCartList.add(cartModle);
    cartList = newCartList;
  }
  get throwCartList{
    return cartList;
  }

  int totalprice(){
    int total =0;
    cartList.forEach((element) {
      total += element.price*element.quantity;
    });
    return total;
  }

  late int deleteIndex;
  void getDeleteIndex(int index){
    deleteIndex= index;
  }
  void delete(){
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }

}
