import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildFeaturedProduct(String name, double price, String image) {
    return Card(
      child: Container(
        height: 250,
        width: 180,
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Container(
              height: 170,
              width: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/$image"),
              )),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProduct(String image, int color) {
    return CircleAvatar(
      maxRadius: 40,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }
  

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'HomePage',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState!
                .openDrawer(); // Add a null check for currentState
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.send_sharp,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children:<Widget> [
            Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search Something',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)))
                                  ),
                      Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Featured',
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'See all',
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _buildFeaturedProduct(
                              image: 'product_1.png',
                              name: 'Man Long T-Shirt',
                              price: 30.0,
                            ),
                            _buildFeaturedProduct(
                              image: 'product_1.png',
                              name: 'Man Long T-Shirt',
                              price: 30.0,
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Categorie',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'See all',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          child: Row(
                            children: <Widget>[
                              _buildCategoryProduct(
                                  image: "product_1.png", color: ""),
                              _buildCategoryProduct(
                                  image: "product_1.png", color: ""),
                              _buildCategoryProduct(
                                  image: "product_1.png", color: ""),
                              _buildCategoryProduct(
                                  image: "product_1.png", color: ""),
                              _buildCategoryProduct(
                                  image: "product_1.png", color: ""),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'New Achieves',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'See all',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                _buildFeaturedProduct(
                                  image: 'product_1.png',
                                  name: 'Man Long T-Shirt',
                                  price: 30.0,
                                ),
                                _buildFeaturedProduct(
                                  image: 'product_1.png',
                                  name: 'Man Long T-Shirt',
                                  price: 30.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
