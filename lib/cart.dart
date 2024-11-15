import 'package:flutter/material.dart';
import 'package:margintopdesigns/utils/color_constant.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "UserAdmin",
      "quantity": 1,
      "price": 100.0,
      "image": "assets/prefix.png"
    },
    {
      "name": "UserAdmin",
      "quantity": 1,
      "price": 100.0,
      "image": "assets/prefix.png"
    },
    {
      "name": "UserAdmin",
      "quantity": 1,
      "price": 100.0,
      "image": "assets/prefix.png"
    },
  ];

  double get totalPrice {
    return cartItems.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));
  }

  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]["quantity"] += 1;
    });
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]["quantity"] > 1) {
        cartItems[index]["quantity"] -= 1;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            height: MediaQuery.sizeOf(context).height * 0.35,
            decoration: const BoxDecoration(color: ColorConstant.primaryColor),
          )),

          // White background for the rest of the screen
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.35,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.7,
              color: Colors.white,
            ),
          ),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.05,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.sizeOf(context).width * 0.03),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image(
                                  width: MediaQuery.sizeOf(context).width * 0.1,
                                  image:
                                      const AssetImage("assets/vector3.png"))),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Text(
                                "Pos",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorConstant.whiteColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.sizeOf(context).width * 0.03),
                              child: MaterialButton(
                                color: ColorConstant.whiteColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () {
                                  Navigator.pushNamed(context, "login2");
                                },
                                child: const Row(
                                  children: [
                                    Image(
                                        width: 20,
                                        image: AssetImage("assets/vector.png")),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: ColorConstant.primaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.2,
            left: MediaQuery.sizeOf(context).width * 0.03,
            right: MediaQuery.sizeOf(context).width * 0.03,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.75,
                decoration: BoxDecoration(
                  //  boxShadow: const [],
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.03,
                      right: MediaQuery.sizeOf(context).width * 0.03,
                      top: MediaQuery.sizeOf(context).height * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "YOUR CART -\n 2 Items",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: MediaQuery.of(context).size.height * 0.43,
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartItems[index];
                            return Column(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  // padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: ColorConstant
                                                .backgroundcartColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                        child: Image.asset(item["image"],
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.15,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.09),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(item["name"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.blue),
                                                onPressed: () =>
                                                    decreaseQuantity(index),
                                              ),
                                              Text(item["quantity"].toString()),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.add_circle,
                                                    color: Colors.blue),
                                                onPressed: () =>
                                                    increaseQuantity(index),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                removeItem(index);
                                              },
                                              child: const CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.red,
                                                child: Icon(size: 20,Icons.delete, color: ColorConstant.whiteColor,),
                                              )),
                                          
                                          Text(
                                              "INR ${item["price"] * item["quantity"]}",
                                              style: const TextStyle(
                                                  color: Colors.blue)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: ColorConstant.backgroundcartColor,
                                  indent: 1,
                                  endIndent: 1,
                                  thickness: 2,
                                ),

                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Container(padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(color: ColorConstant.backgroundcartColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total -",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text("INR ${totalPrice.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                            ElevatedButton(
                              onPressed: () {
                                
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: ColorConstant.whiteColor,
                                    child: Icon(size: 20,Icons.shopping_cart_checkout,
                                        color: ColorConstant.primaryColor),
                                  ),
                                  SizedBox(width: 8),
                                  Text("Checkout",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
