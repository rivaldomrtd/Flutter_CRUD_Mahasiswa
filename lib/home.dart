import 'package:flutter/material.dart';
import 'package:uas_ptm/auth/login.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  bool _isSigningOut = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log Out',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.deepPurple[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 60)),
            Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/1.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('E-Commerce'))
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, left: 12),
                  width: 100,
                  height: 50,
                  child: Text(
                    "Menu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView(
                itemExtent: 100,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(12.0),
                    child: IconButton(
                      icon: const Icon(Icons.male),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(12.0),
                    child: IconButton(
                      icon: const Icon(Icons.female),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(12.0),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(12.0),
                    child: IconButton(
                      icon: const Icon(Icons.delivery_dining),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
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
