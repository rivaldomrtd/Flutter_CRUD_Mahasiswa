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
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(1950, 1);
  final lastDate = DateTime(2025, 12);
  void addData() {
    var url = Uri.parse("http://192.168.43.43/ptm/mahasiswa.php");

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

  static final String uploadEndPoint = 'http://192.168.43.43/ptm/image.php';
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
      "image": base64Image,
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
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
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
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      OutlineButton(
                        onPressed: chooseImage,
                        child: Text('Choose Image'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      showImage(),
                      SizedBox(
                        height: 20.0,
                      ),
                      OutlineButton(
                        onPressed: startUpload,
                        child: Text('Upload Image'),
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
                      SizedBox(
                        height: 20.0,
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
                    startUpload();
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
