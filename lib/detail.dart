import 'package:flutter/material.dart';

import './edit.dart';

class Detail extends StatelessWidget {
  final String masjid;
  final String waktu;
  final String pengisi;
  final String tema;
  final String hari;
  final String tanggal;
  final String kategori;

  Detail(
      {this.masjid,
      this.waktu,
      this.pengisi,
      this.tema,
      this.hari,
      this.tanggal,
      this.kategori});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(masjid),
      ),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  'tes',
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  'tes',
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  'tes',
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  'tes',
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text(
                        "EDIT",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new EditData(),
                          )),
                    ),
                    new RaisedButton(
                      child: new Text(
                        "DELETE",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
