import 'package:flutter/material.dart';
import 'package:uas_ptm/auth/login.dart';

class Mahasiswa extends StatefulWidget {
  @override
  _Mahasiswa createState() => _Mahasiswa();
}

class _Mahasiswa extends State<Mahasiswa> {
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
        ],
      ),
    );
  }
}
