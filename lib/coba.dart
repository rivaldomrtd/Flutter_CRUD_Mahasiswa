import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class Mahasiswa extends StatefulWidget {
  @override
  _Mahasiswa createState() => _Mahasiswa();
}

class _Mahasiswa extends State<Mahasiswa> {
  String? imageLink;
  File? _image;
  //
  TextEditingController namac = TextEditingController();
  TextEditingController nimc = TextEditingController();
  TextEditingController alamatc = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2000, 1);
  final lastDate = DateTime(2021, 12);
  String g = "Pria";
  bool value = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  final TextEditingController nim = TextEditingController(
    text: '',
  );
  final TextEditingController nama = TextEditingController(
    text: '',
  );
  final TextEditingController alamat = TextEditingController(
    text: '',
  );
  final TextEditingController email = TextEditingController(
    text: '',
  );
  final TextEditingController ipk = TextEditingController(
    text: '',
  );
  final TextEditingController tanggal_lahir = TextEditingController(
    text: '',
  );
  String? fakultas;
  String? prodi;
  List<String> _listfakultas = [
    'F.Ekonomi',
    'F.Teknik',
    'F.Sosial Politik',
    'F.Sastra',
    'F.Hukum',
    'F.Psikologi',
  ];
  List<String> _prodteknik = [
    "Teknik Industri (S1).",
    "Teknik Sipil (S1).",
    "Teknik Mesin (S1).",
    "Teknik Arsitektur (S1).",
    "Teknik Elektro (S1).",
    "Teknik Informatika (S1).",
    "Magister Teknik (S2)."
  ];
  List<String> _prodekonomi = [
    "Ekonomi Manajemen (S1).",
    "Ekonomi Akuntansi (S1).",
    "Ekonomi Pembangunan (S1).",
    "Magister Manajemen (S2).",
    "Doktor Ilmu Ekonomi (S3)."
  ];
  List<String> _prodsosopol = [
    "Administrasi Negara (S1)",
    "Administrasi Niaga (S1)",
    "Ilmu Komunikasi (S1)",
    "Magister Administrasi (S2)",
    "Doktor Ilmu Administrasi (S3)"
  ];
  List<String> _prodsastra = ["Sastra Jepang (S1).", "Sastra Inggris (S1)."];
  List<String> _prodhukum = [
    "Ilmu Hukum (S1).",
    "Magister Ilmu Hukum (S2).",
    "Doktor Ilmu Hukum (S3)."
  ];
  List<String> _prodpsikologi = [
    "Psikologi (S1).",
    "Psikologi Jenjang Profesi (S2).",
    "Magister Psikologi (S2)."
  ];
  String? valueChoose;
  //
  //
  void prod() {
    if (fakultas == "F.Ekonomi") {}
  }

  //
  //
  void ressets() {
    setState(() {
      nim.text = "";
      nama.text = "";
      alamat.text = "";
      g = "Pria";
      tanggal_lahir.text = "";
      value = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      email.text = "";
      ipk.text = "";
      fakultas = _listfakultas[0];
      prodi = _prodteknik[0];
    });
  }

  void coba() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Data Mahasiswa',
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: 300.0,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Column(
                children: <Widget>[
                  Text('Foto: '),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('NIM: ' + nim.text),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text('Nama: ' + nama.text),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text("Alamat: " + alamat.text),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text("Gender: " + g),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text('Tanggal Lahir: ' +
                      DateFormat.yMd().format(selectedDate)),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text('Hobby: '),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text("Email: " + email.text),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text("IPK: " + ipk.text),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text("Fakultas: "),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Row(
                children: <Widget>[
                  Text("Prodi: "),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Padding(padding: EdgeInsets.only(bottom: 30, right: 60)),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 268,
              height: 110,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
                      Container(
                        width: 100,
                        child: Text(
                          "NIM",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: 155,
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
                          controller: nim,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5)),
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
                        width: 155,
                        height: 50,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "",
                              hintText: ""),
                          keyboardType: TextInputType.text,
                          controller: nama,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Container(
              width: 100,
              height: 150,
              child: Column(
                children: <Widget>[
                  //just for spacing

                  imageLink != null
                      ? CircleAvatar(
                          child: ClipOval(
                            child: Image.network(imageLink!),
                          ),
                          radius: 40,
                        )
                      : CircleAvatar(
                          child: ClipOval(
                            child: Icon(
                              Icons.person,
                              size: 40,
                            ),
                          ),
                          radius: 40,
                        ),
                  FlatButton(
                    child: Text(
                      "Change Image",
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () async {
                      _image = (await ImagePicker.pickImage(
                          source: ImageSource.gallery)) as File?;
                      FirebaseStorage fs = FirebaseStorage.instance;
                      StorageReference rootReference = fs.ref();
                      StorageReference pictureFolderRef =
                          rootReference.child("pictures").child("image");
                      pictureFolderRef
                          .putFile(_image)
                          .onComplete
                          .then((storageTask) async {
                        String link = await storageTask.ref.getDownloadURL();
                        print("uploaded");
                        setState(() {
                          imageLink = link;
                        });
                      });
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                  )
                  //
                  //
                  //
                  //
                ],
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
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
              width: 155,
              height: 50,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                    border: OutlineInputBorder(), labelText: "", hintText: ""),
                keyboardType: TextInputType.text,
                controller: alamat,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
            Container(
              width: 85,
              child: Text(
                "Gender",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Radio(
              value: "Pria",
              groupValue: g,
              onChanged: (String? value) {
                setState(() {
                  g = value!;
                });
              },
            ),
            Text(
              'Pria',
              style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: "Wanita",
              groupValue: g,
              onChanged: (String? value) {
                setState(() {
                  g = value!;
                });
              },
            ),
            Text(
              'Wanita',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
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
              width: 155,
              child: TextField(
                onTap: () {
                  _openDatePicker(context);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: '$selectedDate'.split(' ')[0],
                  suffixIcon: Icon(
                    Icons.calendar_today_rounded,
                  ),
                ),
                controller: tanggal_lahir,
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 5)),
            Container(
              width: 85,
              child: Text(
                "Hoby",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 10),
                Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                Text(
                  'Menari',
                  style: TextStyle(fontSize: 17.0),
                ),
                Padding(padding: EdgeInsets.only(left: 25)),
                SizedBox(width: 10),
                Checkbox(
                  value: this.value2,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value2 = value!;
                    });
                  },
                ),
                Text(
                  'Nonton Film',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 5)),
            Container(
              width: 85,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 10),
                Checkbox(
                  value: this.value3,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value3 = value!;
                    });
                  },
                ),
                Text(
                  'Sepakbola',
                  style: TextStyle(fontSize: 17.0),
                ),
                SizedBox(width: 10),
                Checkbox(
                  value: this.value4,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value4 = value!;
                    });
                  },
                ),
                Text(
                  'Travelling',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 5)),
            Container(
              width: 85,
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 10),
                Checkbox(
                  value: this.value5,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value5 = value!;
                    });
                  },
                ),
                Text(
                  'Berenang',
                  style: TextStyle(fontSize: 17.0),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                SizedBox(width: 10),
                Checkbox(
                  value: this.value6,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value6 = value!;
                    });
                  },
                ),
                Text(
                  'Musik',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
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
              width: 155,
              height: 50,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                    border: OutlineInputBorder(), labelText: "", hintText: ""),
                keyboardType: TextInputType.text,
                controller: email,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
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
              width: 155,
              height: 50,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                    border: OutlineInputBorder(), labelText: "", hintText: ""),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                ],
                controller: ipk,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
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
              width: 120,
              child: DropdownButton<String>(
                value: fakultas,
                style: TextStyle(color: Colors.black),
                items: _listfakultas.map((String? value) {
                  return DropdownMenuItem(
                    child: Text(value!),
                    value: value,
                  );
                }).toList(),
                hint: Text(
                  " ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 5,
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    fakultas = value!;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
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
              width: 180,
              child: DropdownButton<String>(
                value: prodi,
                style: TextStyle(color: Colors.black),
                items: _prodteknik.map((String? value) {
                  return DropdownMenuItem(
                    child: Text(value!),
                    value: value,
                  );
                }).toList(),
                hint: Text(
                  " ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 5,
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    prodi = value!;
                  });
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 20, left: 5)),
            Container(
              width: 100,
              child: RaisedButton(
                child: Text("Proses"),
                onPressed: () {
                  coba();
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 15)),
            Container(
              width: 100,
              child: RaisedButton(
                child: Text("Reset"),
                onPressed: () {
                  ressets();
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 8)),
          ],
        ),
      ]),
    ])));
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
