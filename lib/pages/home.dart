import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_shop/controllers/categories/categories_controller.dart';
import 'package:mini_shop/main.dart';
import 'package:mini_shop/pages/cart.dart';
import 'package:mini_shop/pages/splash.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoriesController categoriesController = CategoriesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        // backgroundColor: Colors.grey[150],
        backgroundColor: Colors.yellow[200],
        body: Obx(() {
          if (categoriesController.loading.value)
            return Center(child: CircularProgressIndicator());
          if (categoriesController.categories.isEmpty) {
            return Center(
              child: Text("No Categories founds"),
            );
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                _buildTop(),
                _buildCategoriesRow(),
                Expanded(
                  child: Obx(
                    () {
                      if (productsController.loading.value)
                        return Center(child: CircularProgressIndicator());
                      if (productsController.products.isEmpty) {
                        return Center(
                          child: Text("No Prodcut founds"),
                        );
                      }
                      // print(productsController.showGrid.value);
                      if (productsController.showGrid.value)
                        return GridView.builder(
                          padding: EdgeInsets.only(top: 14),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: productsController.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 0.0,
                              child: Container(
                                height: 100,
                                padding: EdgeInsets.all(8),
                                margin: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(productsController
                                              .products[index]["image"]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productsController.products[index]
                                                  ["title"],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Expanded(
                                              child: Text(
                                                productsController
                                                        .products[index]
                                                    ["description"],
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              "\$${productsController.products[index]["price"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      return _buildProductsList();
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }

  ListView _buildProductsList() {
    return ListView.builder(
      itemCount: productsController.products.length,
      padding: EdgeInsets.only(top: 8),
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        productsController.products[index]["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsController.products[index]["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          productsController.products[index]["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${productsController.products[index]["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Store",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              productsController.toggleGrid();
            },
            icon: Icon(Icons.filter_list)),
      ],
    );
  }

  Container _buildCategoriesRow() {
    return Container(
      height: 35.0,
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesController.categories.length,
          itemBuilder: (context, index) => Obx(
                () => InkWell(
                  onTap: () {
                    categoriesController.changeCategories(index);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: index == categoriesController.currentIndex.value
                          ? Colors.black87
                          : Colors.transparent,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      categoriesController.categories[index],
                      style: TextStyle(
                        color: index == categoriesController.currentIndex.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: BackButton(),
      elevation: 0,
      title: Text(
        "AF Thrifting ",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {
              authController.logout();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => SplashScreen(),
              ));
            },
            icon: Icon(Icons.logout_outlined)),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CartPage(),
            ));
          },
          icon: Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
