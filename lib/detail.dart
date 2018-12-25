import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './main.dart';
import './edit.dart';

class Detail extends StatefulWidget {
  final String id;
  final String masjid;
  final String waktu;
  final String pengisi;
  final String tema;
  final String hari;
  final String tanggal;
  final String kategori;

  Detail(
      {this.id,
      this.masjid,
      this.waktu,
      this.pengisi,
      this.tema,
      this.hari,
      this.tanggal,
      this.kategori});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://palembangmengaji.forkismapalembang.com/deleteData.php";
    http.post(url, body: {'id': widget.id});
  }

  void confirm() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Yakin ingin menghapus '${widget.masjid}'?"),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "OK Hapus!",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  deleteData();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MyApp(),
                  ));
                },
              ),
              RaisedButton(
                child: Text("Cancel", style: TextStyle(color: Colors.white)),
                color: Colors.green,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.masjid),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Text(
                    widget.masjid,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    widget.id,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    widget.pengisi,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    widget.tema,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    widget.hari,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    widget.tanggal,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    widget.kategori,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(
                          "EDIT",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => EditData(
                                    id: widget.id,
                                    masjid: widget.masjid,
                                    waktu: widget.waktu,
                                    pengisi: widget.pengisi,
                                    tema: widget.tema,
                                    hari: widget.hari,
                                    tanggal: widget.tanggal,
                                    kategori: widget.kategori,
                                  ),
                            )),
                      ),
                      RaisedButton(
                        child: Text(
                          "DELETE",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        onPressed: () => confirm(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
