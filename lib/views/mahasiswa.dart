import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_ptm/auth/login.dart';
import 'package:uas_ptm/routes/side_menu.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
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
  String? fakultas;
  String? prodi;
  List<String> prod = [];
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

  static final String uploadEndPoint = 'http://192.168.1.11/ptm/image.php';
  Future<File>? file;
  String status = '';
  String? base64Image;
  File? tmpFile;
  String errMessage = 'Error Uploading Image';

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  picture() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile!.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "foto": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data!.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data!,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            '',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            '',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

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
                padding: const EdgeInsets.all(8.0), child: Text('VALD00S-CRUD'))
          ],
        ),
      ),
      drawer: Sidemenu(),
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
                          FilteringTextInputFormatter.digitsOnly
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
                          FocusScope.of(context).requestFocus(new FocusNode());
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
                        keyboardType: TextInputType.text,
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
                        controller: controller_telpon,
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
                          if (fakultas == 'F.Ekonomi') {
                            prod = _prodekonomi;
                          } else if (fakultas == 'F.Hukum') {
                            prod = _prodhukum;
                          } else if (fakultas == 'F.Psikologi') {
                            prod = _prodpsikologi;
                          } else if (fakultas == 'F.Sosial Politik') {
                            prod = _prodsosopol;
                          } else if (fakultas == 'F.Sastra') {
                            prod = _prodsastra;
                          } else if (fakultas == 'F.Teknik') {
                            prod = _prodteknik;
                          }
                          setState(() {
                            prodi = null;
                            fakultas = value!;
                          });
                        },
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
                      width: 180,
                      child: DropdownButton<String>(
                        value: prodi,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        items: prod.map((String? value) {
                          return DropdownMenuItem(
                            child: Text(value!),
                            value: value,
                          );
                        }).toList(),
                        hint: Text(
                          "Prodi",
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                          ),
                        ),
                        onChanged: (prod) {
                          setState(() {
                            prodi = prod!;
                          });
                        },
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
                        controller: controller_ipk,
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
                        controller: controller_dosen,
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
                        "Foto",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Container(
                  width: 200,
                  height: 300,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      showImage(),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Column(
                        children: <Widget>[
                          OutlineButton(
                            onPressed: chooseImage,
                            child: Text('Folder'),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          OutlineButton(
                            onPressed: startUpload,
                            child: Text('Camera'),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            status,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
