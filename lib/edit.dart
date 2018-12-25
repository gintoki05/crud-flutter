import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './main.dart';

class EditData extends StatefulWidget {
  final String id;
  final String masjid;
  final String waktu;
  final String pengisi;
  final String tema;
  final String hari;
  final String tanggal;
  final String kategori;

  EditData(
      {this.id,
      this.masjid,
      this.waktu,
      this.pengisi,
      this.tema,
      this.hari,
      this.tanggal,
      this.kategori});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerMasjid;
  TextEditingController controllerWaktu;
  TextEditingController controllerPengisi;
  TextEditingController controllerTema;
  TextEditingController controllerHari;
  TextEditingController controllerTanggal;
  TextEditingController controllerKategori;

  void editData() {
    var url = "http://palembangmengaji.forkismapalembang.com/editData.php";

    http.post(
      url,
      body: {
        'id': widget.id,
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
  void initState() {
    controllerMasjid = TextEditingController(text: widget.masjid);
    controllerWaktu = TextEditingController(text: widget.waktu);
    controllerPengisi = TextEditingController(text: widget.pengisi);
    controllerTema = TextEditingController(text: widget.tema);
    controllerHari = TextEditingController(text: widget.hari);
    controllerTanggal = TextEditingController(text: widget.tanggal);
    controllerKategori = TextEditingController(text: widget.kategori);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Padding(
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
                    decoration: InputDecoration(
                        hintText: "Masjid", labelText: "Masjid"),
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
                    child: Text("Edit Data",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.blueAccent,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        editData();
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
      ),
    );
  }
}
