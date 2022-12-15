import 'dart:ui';

import 'package:flutter/material.dart';

class Home_veg extends StatelessWidget {
  static const id = '/home_veg';
  Widget listTile({IconData icon, String title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Vegi"),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            color: Colors.red,
            child: DrawerHeader(
              child: Row(
                children: [
                  Text(
                    "Rajat",
                    style: TextStyle(fontSize: 45, color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 86,
                      right: 14,
                    ),
                    child: Text(
                      "The All in one food shop",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          listTile(
            icon: Icons.notifications,
            title: "Notifications",
          ),
          listTile(
            icon: Icons.star,
            title: "Ratings & Reviews",
          ),
          listTile(
            icon: Icons.access_alarm,
            title: "FAQs",
          ),
          listTile(
            icon: Icons.location_city,
            title: "Terms & Conditions",
          ),
          listTile(
            icon: Icons.access_time,
            title: "Privacy Policy",
          ),
          listTile(
            icon: Icons.domain,
            title: "About Us",
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contact Us",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Call Us:",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("+91 8889797777"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        "Mail Us:",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("rajat@mail.com"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
      // appBar: AppBar(
      //   title: Text("Vegi"),
      //   actions: [
      //     CircleAvatar(
      //       radius: 20,
      //       backgroundColor: Colors.white24,
      //       child: Icon(
      //         Icons.search,
      //         size: 20,
      //         color: Colors.white,
      //       ),
      //     )
      //   ],
      //   backgroundColor: Colors.red,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://w7.pngwing.com/pngs/778/968/png-transparent-juice-fruit-red-drink-free-to-pull-the-summer-drinks-decorative-patterns-free-logo-design-template-food-geometric-pattern.png")),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      child: Container(
                        height: 90,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 5,
                            //     blurRadius: 7,
                            //     offset:
                            //         Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                  'https://freepngimg.com/thumb/vegetable/24646-6-vegetable-photos-thumb.png'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Fruits',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: Container(
                        height: 90,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 5,
                            //     blurRadius: 7,
                            //     offset:
                            //         Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                  'https://thumbs.dreamstime.com/b/fruits-vegetables-15528773.jpg'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Vegitables',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: Container(
                        height: 90,
                        width: 75,
                        decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 5,
                            //     blurRadius: 7,
                            //     offset:
                            //         Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                  'https://thumbs.dreamstime.com/b/groceries-23958998.jpg'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Groceries',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: Container(
                        height: 90,
                        width: 75,
                        decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.5),
                            //     spreadRadius: 5,
                            //     blurRadius: 7,
                            //     offset:
                            //         Offset(0, 3), // changes position of shadow
                            //   ),
                            // ],
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                  'https://media.istockphoto.com/vectors/seasonings-herbs-and-spices-vector-id857599514'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'seasonings',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Fruits',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      child: Container(
                        height: 160,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                  'https://freepngimg.com/thumb/apple/7-2-apple-fruit-png.png'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Apple',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "10/500gm",
                                  style: TextStyle(color: Colors.black38),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: MaterialButton(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      onPressed: () {}),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: Container(
                        height: 160,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                  'https://4.imimg.com/data4/HP/GL/ANDROID-5323173/product-500x500.jpeg'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'cherries',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "100/600gm",
                                  style: TextStyle(color: Colors.black38),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: 22,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 11,
                                          backgroundColor: Colors.white30,
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white70,
                                            size: 15,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '1',
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        CircleAvatar(
                                          radius: 9,
                                          backgroundColor: Colors.white30,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white70,
                                            size: 17,
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: Container(
                        height: 170,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                  'https://img.freepik.com/free-vector/vector-ripe-yellow-banana-bunch-isolated-white-background_1284-45456.jpg'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Bannana',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "200/500gm",
                                  style: TextStyle(color: Colors.black38),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    margin: EdgeInsets.all(2),
                                    height: 22,
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 11,
                                          backgroundColor: Colors.white30,
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white70,
                                            size: 10,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '1',
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        CircleAvatar(
                                          radius: 11,
                                          backgroundColor: Colors.white30,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white70,
                                            size: 11,
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Vegitables',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      child: Container(
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                  'https://static.vecteezy.com/system/resources/thumbnails/006/199/846/small_2x/carrot-vegetable-fresh-free-vector.jpg'),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Carrot',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 25,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(8)),
                              child: MaterialButton(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: Container(
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                  'https://www.morningagclips.com/wp-content/uploads/2020/08/Thomson_International_Red_Onions__Salmonella_Lawsuit-720x400.jpg'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'onion',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                            Container(
                              height: 25,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(8)),
                              child: MaterialButton(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      child: Container(
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.network(
                                  'https://www.tastingtable.com/img/gallery/the-trick-that-will-keep-your-potatoes-from-turning-brown/intro-1648573931.jpg'),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  'Potato',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                            Container(
                              height: 25,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(8)),
                              child: MaterialButton(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: DefaultTabController(
          length: 4,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.home_outlined),
                text: "MyCart",
              ),
              Tab(
                icon: Icon(Icons.home_work),
                text: "Profile",
              )
            ],
          ),
        ),
      ),
    );
  }
}
