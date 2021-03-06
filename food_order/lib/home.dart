import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/about_contact.dart';
import 'package:food_order/categories.dart';
import 'package:food_order/categories_modle.dart';
import 'package:food_order/details_page.dart';
import 'package:food_order/foodModle.dart';
import 'package:food_order/food_categories_modle.dart';
import 'package:food_order/main.dart';
import 'package:food_order/profile.dart';
import 'package:food_order/provider.dart';
import 'package:food_order/user_model.dart';
import 'package:provider/provider.dart';

import 'bottom_Container.dart';
import 'cart_page.dart';
import 'contact.dart';

// late UserModel userModel;
// Future getCurrentUserDataFunction() async{
//   await FirebaseFirestore.instance
//       .collection('UserData')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .get()
//       .then(
//         (DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         userModel = UserModel.fromDocument(documentSnapshot);
//       } else {
//         print("Document does not exist the database");
//       }
//     },
//   );
// }

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {




  Widget categoriesContainer(
      {required Function()? onTap,
      required String image,
      required String name}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(right: 20.0),
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image)),
                color: Color(getColorHexFromStr("#fde696")),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15, color: Colors.black87),
        )
      ],
    );
  }

  Widget drawerItem({required String name, required IconData,required Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          IconData,
          color: Colors.black,
        ),
        title: Text(name, style: TextStyle(color: Colors.black)),
      ),
    );
  }

  List<CategoriesM> burgerList = [];
  List<CategoriesM> drinksList = [];
  List<CategoriesM> pizzaList = [];
  List<CategoriesM> momoList = [];
  List<CategoriesM> biriyaniList = [];
  List<CategoriesM> saladList = [];

  List<FoodModle> singleFoodList = [];
  List<CategoriesM> categoryFoodList = [];

  List<FoodCategoriesModle> burgerCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> momoCategoriesList = [];
  List<FoodCategoriesModle> saladCategoriesList = [];
  List<FoodCategoriesModle> drinksCategoriesList = [];
  List<FoodCategoriesModle> biriyaniCategoriesList = [];

  Widget burger() {
    return Row(
        children: burgerList
            .map((e) => categoriesContainer(
                onTap: () async {
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Categories(
                            list: burgerCategoriesList,
                          )));
                },
                image: e.image,
                name: e.name))
            .toList());
  }

  Widget drinks() {
    return Row(
        children: drinksList
            .map((e) => categoriesContainer(
                onTap: () async {
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Categories(
                            list: drinksCategoriesList,
                          )));
                },
                image: e.image,
                name: e.name))
            .toList());
  }

  Widget pizza() {
    return Row(
        children: pizzaList
            .map((e) => categoriesContainer(
                onTap: () async {
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Categories(
                            list: pizzaCategoriesList,
                          )));
                },
                image: e.image,
                name: e.name))
            .toList());
  }

  Widget momo() {
    return Row(
        children: momoList
            .map((e) => categoriesContainer(
                onTap: () async {
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Categories(
                            list: momoCategoriesList,
                          )));
                },
                image: e.image,
                name: e.name))
            .toList());
  }

  Widget biriyani() {
    return Row(
        children: biriyaniList
            .map((e) => categoriesContainer(
                onTap: () async {
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Categories(
                            list: biriyaniCategoriesList,
                          )));
                },
                image: e.image,
                name: e.name))
            .toList());
  }

  Widget salad() {
    return Row(
        children: saladList
            .map((e) => categoriesContainer(
                onTap: () async {
                  await Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Categories(
                            list: saladCategoriesList,
                          )));
                },
                image: e.image,
                name: e.name))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    Myprovider provider = Provider.of<Myprovider>(context);

    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;
    provider.getDrinksCategory();
    drinksList = provider.throwDrinksList;
    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;
    provider.getMomoCategory();
    momoList = provider.throwMomoList;
    provider.getBiriyaniCategory();
    biriyaniList = provider.throwBiriyaniList;
    provider.getSaladCategory();
    saladList = provider.throwSaladList;


    //foodCategories
    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;
    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;
    provider.getMomoCategoriesList();
    momoCategoriesList = provider.throwMomoCategoriesList;
    provider.getSaladCategoriesList();
    saladCategoriesList = provider.throwSaladCategoriesList;
    provider.getDrinksCategoriesList();
    drinksCategoriesList = provider.throwDrinksCategoriesList;
    provider.getBiriyaniCategoriesList();
    biriyaniCategoriesList = provider.throwBiriyaniCategoriesList;

    //single//
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    // getCurrentUserDataFunction();

    return Scaffold(

      drawer: Drawer(
        child: Container(
          color: Color(getColorHexFromStr('#fbcd7a')),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/image.png'),
                    )),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    accountName: Text(
                      ("Anushika"),
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: Text(
                      ("Shika@gmail.com"),
                      style: TextStyle(color: Colors.black),
                    )),
                drawerItem(name: "Profile", IconData: Icons.person,onTap: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                }),
                drawerItem(name: "Cart", IconData: Icons.add_shopping_cart,onTap: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                }),
                drawerItem(name: "About", IconData: Icons.announcement_rounded,onTap: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => about_Us(),
                    ),
                  );
                }),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Text("Communicate",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                drawerItem(name: "Contact Us", IconData: Icons.lock,onTap: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => contact(),
                    ),
                  );
                }),
                drawerItem(name: "Logout", IconData: Icons.exit_to_app,onTap: (){}),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child:
                CircleAvatar(backgroundImage: AssetImage('assets/profile.png')),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  decoration: InputDecoration(
                hintText: "Search Food",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                filled: true,
                fillColor: Colors.white70,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(10)),
              )),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  burger(),
                  pizza(),
                  momo(),
                  salad(),
                  drinks(),
                  biriyani()
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 510,
                child: GridView.count(
                    shrinkWrap: false,
                    primary: false,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: singleFoodList
                        .map(
                          (e) => BottomContainer(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              image: e.image,
                                              price: e.price,
                                              des: e.des,
                                              name: e.name,
                                            )));
                              },
                              image: e.image,
                              name: e.name,
                              price: e.price),
                        )
                        .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
