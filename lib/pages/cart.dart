import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_shop/controllers/cart/cart_controller.dart';
// import 'package:mini_shop/controllers/cart_repository.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      backgroundColor: Colors.yellow[200],
      appBar: _buildAppBar(),
      body: Obx(
        () {
          if (cartController.loading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (cartController.cartItems.isEmpty) {
            return Center(child: Text("No Cart Items found!"));
          }
          return Stack(
            children: [
              Container(),
              Positioned.fill(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartController.cartItems.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (context, index) => Card(
                          elevation: 0,
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              cartController.cartItems[index]
                                                  ["product"]["image"]))),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartController.cartItems[index]
                                              ["product"]["title"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            cartController.cartItems[index]
                                                ["product"]["description"],
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "\$${cartController.cartItems[index]["product"]["price"]}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.grey[200],
                                      child: Icon(Icons.remove),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(cartController
                                          .cartItems[index]["quantity"]
                                          .toString()),
                                    ),
                                    Container(
                                      color: Colors.grey[200],
                                      child: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
              _buildBottom(),
            ],
          );
        },
      ),
    );
  }

  Positioned _buildBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: 8,
          top: 4.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${cartController.subtotal}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      "Subtotal does not include shipping",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 3.0,
                      ),
                      primary: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Check out"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 3.0,
                      ),
                      primary: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check out with",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://1.bp.blogspot.com/-QX9V30yKSnY/XnK1EwNfPoI/AAAAAAAASbw/ynfzj_RgdOU7DkpYIXRC18GWMu6kKCtkQCLcBGAsYHQ/s1600/GoPay.png")),
                            // "https://1000logos.net/wp-content/uploads/2021/05/GoPay-Logo.png")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text("Continue Shopping"),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
      ],
      title: Text(
        "Cart",
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
