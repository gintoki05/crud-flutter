import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './main.dart';

class EditData extends StatefulWidget {
  final String masjid;
  final String waktu;
  final String pengisi;
  final String tema;
  final String hari;
  final String tanggal;
  final String kategori;

  EditData(
      {this.masjid,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.masjid),
      ),
    );
  }
}
