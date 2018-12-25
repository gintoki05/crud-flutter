import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './detail.dart';
import './add_data.dart';

Future<List<Jadwal>> fetchJadwals(http.Client client) async {
  final response =
      await client.get('http://palembangmengaji.forkismapalembang.com/api.php');

  // Use the compute function to run parseJadwals in a separate isolate
  return compute(parseJadwals, response.body);
}

// A function that will convert a response body into a List<Jadwal>
List<Jadwal> parseJadwals(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Jadwal>((json) => Jadwal.fromJson(json)).toList();
}

class Jadwal {
  final String id;
  final String masjid;
  final String waktu;
  final String pengisi;
  final String tema;
  final String hari;
  final String tanggal;
  final String kategori;

  Jadwal(
      {this.id,
      this.masjid,
      this.waktu,
      this.pengisi,
      this.tema,
      this.hari,
      this.tanggal,
      this.kategori});

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      id: json['id'] as String,
      masjid: json['masjid'] as String,
      waktu: json['waktu'] as String,
      pengisi: json['pengisi'] as String,
      tema: json['tema'] as String,
      hari: json['hari'] as String,
      tanggal: json['tanggal'] as String,
      kategori: json['kategori'] as String,
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Crud Palembang Mengaji';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddData(),
            )),
      ),
      body: FutureBuilder<List<Jadwal>>(
        future: fetchJadwals(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? JadwalsList(jadwals: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class JadwalsList extends StatelessWidget {
  final List<Jadwal> jadwals;

  JadwalsList({Key key, this.jadwals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jadwals == null ? 0 : jadwals.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                          id: jadwals[index].id,
                          masjid: jadwals[index].masjid,
                          waktu: jadwals[index].waktu,
                          pengisi: jadwals[index].pengisi,
                          tema: jadwals[index].tema,
                          hari: jadwals[index].hari,
                          tanggal: jadwals[index].tanggal,
                          kategori: jadwals[index].kategori,
                        ),
                  ),
                ),
            child: Card(
              child: Text(jadwals[index].masjid),
            ),
          ),
        );
      },
    );
  }
}
