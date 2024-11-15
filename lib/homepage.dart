import 'package:flutter/material.dart';
import 'package:margintopdesigns/utils/color_constant.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Item> items = [
    Item(name: 'UserAdmin', price: 100.00, weight: 111),
    Item(name: 'UserAdmin', price: 1000.00, weight: 181),
   
  ];
  List<Item> filteredItems = [];

  
  List<String> categories = [
    "All Categories",
    "Electronics",
    "Groceries",
    "Clothing"
  ];
  String selectedCategory = "All Categories";

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    setState(() {
      filteredItems = items
          .where((item) => item.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            height: MediaQuery.sizeOf(context).height * 0.35,
            decoration: const BoxDecoration(color: ColorConstant.primaryColor),
          )),

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
                          child: DropdownButton<String>(
                            value: selectedCategory,
                            icon: Icon(
                                size: MediaQuery.sizeOf(context).width * 0.08,
                                Icons.arrow_drop_down_rounded,
                                color: Colors.white),
                            dropdownColor: Colors.blue,
                            underline: const SizedBox(),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                _filterByCategory(newValue);
                              }
                            },
                            items: categories.map<DropdownMenuItem<String>>(
                                (String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(
                                  category,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * 0.03),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search Product',
                          prefixIcon: Container(
                              child: Image(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.03,
                                  width: MediaQuery.sizeOf(context).width * 0.1,
                                  image:
                                      const AssetImage("assets/vector2.png"))),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.grey
                                    .shade200), 
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.grey
                                    .shade200),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                  ],
                ),
              )),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.24,
            left: MediaQuery.sizeOf(context).width * 0.03,
            right: MediaQuery.sizeOf(context).width * 0.03,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.77,
                decoration: BoxDecoration(
                  color: ColorConstant.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: Card(
                        color: ColorConstant.whiteColor,
                        margin: const EdgeInsets.symmetric(
                            vertical: 6.0, horizontal: 8),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(
                                            0.5), 
                                        spreadRadius:
                                            1, 
                                        blurRadius:
                                            5,
                                        offset: const Offset(0,
                                            2), 
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Image.asset(
                                  'assets/prefix.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),

                              Expanded(
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "INR ${item.price}".toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),

                              
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "${item.weight}kg".toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height *
                0.008,
            left: MediaQuery.sizeOf(context).width * 0.05,
            right: MediaQuery.sizeOf(context).width * 0.05,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined,
                        color: Colors.blue), 
                    onPressed: () {
                      Navigator.pushNamed(context, "homepage");
                      
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.grey), 
                    onPressed: () {
                      
                      Navigator.pushNamed(context, 'cartpage');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings,
                        color: Colors.grey), 
                    onPressed: () {
                      
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_outline,
                        color: Colors.grey), 
                    onPressed: () {
                      
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String name;
  final double price;
  final int weight;

  Item({required this.name, required this.price, required this.weight});
}
