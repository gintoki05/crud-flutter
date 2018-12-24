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
                    masjid,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    waktu,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    pengisi,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    tema,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    hari,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    kategori,
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
                                    masjid: masjid,
                                    waktu: waktu,
                                    pengisi: pengisi,
                                    tema: tema,
                                    hari: hari,
                                    tanggal: tanggal,
                                    kategori: kategori,
                                  ),
                            )),
                      ),
                      RaisedButton(
                        child: Text(
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
        ],
      ),
    );
  }
}
