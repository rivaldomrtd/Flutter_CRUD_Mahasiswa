import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:date_time_picker/date_time_picker.dart';

class Mahasiswa extends StatefulWidget {
  @override
  _Mahasiswa createState() => _Mahasiswa();
}

class _Mahasiswa extends State<Mahasiswa> {
  TextEditingController controller_nbi = TextEditingController();
  TextEditingController controller_nama = TextEditingController();
  TextEditingController controller_alamat = TextEditingController();
  TextEditingController controller_tanggal = TextEditingController();
  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_telpon = TextEditingController();
  TextEditingController controller_prodi = TextEditingController();
  TextEditingController controller_fakultas = TextEditingController();
  TextEditingController controller_ipk = TextEditingController();
  TextEditingController controller_dosen = TextEditingController();
  TextEditingController controller_foto = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(1950, 1);
  final lastDate = DateTime(2025, 12);
  void addData() {
    var url = Uri.parse("http://192.168.1.11/ptm/mahasiswa.php");

    http.post(url, body: {
      "nbi": controller_nbi.text,
      "nama": controller_nama.text,
      "alamat": controller_alamat.text,
      "tgl_lahir": controller_tanggal.text,
      "email": controller_email.text,
      "no_telpon": controller_telpon.text,
      "prodi": controller_prodi.text,
      "fakultas": controller_fakultas.text,
      "ipk": controller_ipk.text,
      "dosen_wali": controller_dosen.text,
      "foto": controller_foto.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "NBI",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                        ],
                        controller: controller_nbi,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Nama",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.text,
                        controller: controller_nama,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Alamat",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.text,
                        controller: controller_alamat,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        onTap: () {
                          _openDatePicker(context);
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: '$selectedDate'.split(' ')[0],
                          suffixIcon: Icon(
                            Icons.calendar_today_rounded,
                          ),
                        ),
                        controller: controller_tanggal,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"))
                        ],
                        controller: controller_email,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Nomor Telp",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                        ],
                        controller: controller_nbi,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Prodi",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.text,
                        controller: controller_alamat,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Fakultas",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.text,
                        controller: controller_alamat,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "IPK",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                        ],
                        controller: controller_nbi,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                    Container(
                      width: 100,
                      child: Text(
                        "Dosen Wali",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: new InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "",
                            hintText: ""),
                        keyboardType: TextInputType.text,
                        controller: controller_alamat,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _openDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }
}
