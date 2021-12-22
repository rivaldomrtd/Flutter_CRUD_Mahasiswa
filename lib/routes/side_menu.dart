import 'package:flutter/material.dart';
import 'package:uas_ptm/auth/login.dart';
import 'package:uas_ptm/views/dosen.dart';
import 'package:uas_ptm/views/lap_dosen.dart';
import 'package:uas_ptm/views/lap_mahasiswa.dart';
import 'package:uas_ptm/views/mahasiswa.dart';

class Sidemenu extends StatelessWidget {
  bool _isSigningOut = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '1461900135',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.none, image: AssetImage('images/2.png'))),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Mahasiswa'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Mahasiswa(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Dosen'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Dosen(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.table_rows),
            title: Text('Laporan Mahasiswa'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Lap_Mahasiswa(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.table_rows),
            title: Text('Laporan Dosen'),
            onTap: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Lap_Dosen(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}
