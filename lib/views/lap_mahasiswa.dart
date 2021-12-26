import 'package:flutter/material.dart';
import 'package:uas_ptm/auth/login.dart';
import 'package:uas_ptm/routes/side_menu.dart';
import 'dart:async';
import 'dart:convert';

class Lap_Mahasiswa extends StatefulWidget {
  @override
  _Lap_Mahasiswa createState() => _Lap_Mahasiswa();
}

class _Lap_Mahasiswa extends State<Lap_Mahasiswa> {
  bool _isSigningOut = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[700],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 40)),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text('VALD00S-CRUD'))
            ],
          ),
        ),
        drawer: Sidemenu(),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FractionColumnWidth(.1),
                1: FractionColumnWidth(.1),
                2: FractionColumnWidth(.1),
                3: FractionColumnWidth(.1),
                4: FractionColumnWidth(.1),
                5: FractionColumnWidth(.1),
                6: FractionColumnWidth(.1),
                7: FractionColumnWidth(.1),
                8: FractionColumnWidth(.1),
                9: FractionColumnWidth(.1),
                10: FractionColumnWidth(.1),
                11: FractionColumnWidth(.1)
              },
              children: [
                TableRow(children: [
                  Column(children: [Text('NBI')]),
                  Column(children: [Text('Nama')]),
                  Column(children: [Text('Alamat')]),
                  Column(children: [Text('tgl_lahir')]),
                  Column(children: [Text('email')]),
                  Column(children: [Text('no_telp')]),
                  Column(children: [Text('prodi')]),
                  Column(children: [Text('fakultas')]),
                  Column(children: [Text('ipk')]),
                  Column(children: [Text('dosen_wali')]),
                  Column(children: [Text('foto')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('11')]),
                  Column(children: [Text('Joko')]),
                  Column(children: [Text('Malang')]),
                  Column(children: [Text('11')]),
                  Column(children: [Text('Joko')]),
                  Column(children: [Text('Malang')]),
                  Column(children: [Text('11')]),
                  Column(children: [Text('Joko')]),
                  Column(children: [Text('Malang')]),
                  Column(children: [Text('11')]),
                  Column(children: [Text('Joko')]),
                ]),
                TableRow(children: [
                  Column(children: [Text('12')]),
                  Column(children: [Text('Amir')]),
                  Column(children: [Text('Mojokerto')]),
                  Column(children: [Text('12')]),
                  Column(children: [Text('Amir')]),
                  Column(children: [Text('Mojokerto')]),
                  Column(children: [Text('12')]),
                  Column(children: [Text('Amir')]),
                  Column(children: [Text('Mojokerto')]),
                  Column(children: [Text('12')]),
                  Column(children: [Text('Amir')]),
                ]),
              ],
            ),
          ),
        ])));
  }
}
