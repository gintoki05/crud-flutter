import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerMasjid = TextEditingController();
  TextEditingController controllerWaktu = TextEditingController();
  TextEditingController controllerPengisi = TextEditingController();
  TextEditingController controllerTema = TextEditingController();
  TextEditingController controllerHari = TextEditingController();
  TextEditingController controllerTanggal = TextEditingController();
  TextEditingController controllerKategori = TextEditingController();

  void addData() {
    var url = "http://palembangmengaji.forkismapalembang.com/adddata.php";

    http.post(
      url,
      body: {
        'masjid': controllerMasjid.text,
        'waktu': controllerWaktu.text,
        'pengisi': controllerPengisi.text,
        'tema': controllerTema.text,
        'hari': controllerHari.text,
        'tanggal': controllerTanggal.text,
        'kategori': controllerKategori.text
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Masukkan data';
                    }
                  },
                  controller: controllerMasjid,
                  decoration:
                      InputDecoration(hintText: "Masjid", labelText: "Masjid"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Masukkan data';
                    }
                  },
                  controller: controllerWaktu,
                  decoration:
                      InputDecoration(hintText: "Waktu", labelText: "Waktu"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Masukkan data';
                    }
                  },
                  controller: controllerPengisi,
                  decoration: InputDecoration(
                      hintText: "Pengisi", labelText: "Pengisi"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Masukkan data';
                    }
                  },
                  controller: controllerTema,
                  decoration:
                      InputDecoration(hintText: "Tema", labelText: "Tema"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Masukkan data';
                    }
                  },
                  controller: controllerHari,
                  decoration:
                      InputDecoration(hintText: "Hari", labelText: "Hari"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Masukkan data';
                    }
                  },
                  controller: controllerTanggal,
                  decoration: InputDecoration(
                      hintText: "Tanggal", labelText: "Tanggal"),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Masukkan data';
                    }
                  },
                  controller: controllerKategori,
                  decoration: InputDecoration(
                      hintText: "Kategori", labelText: "Kategori"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text("Tambah Data",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.blueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      addData();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyApp()),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
