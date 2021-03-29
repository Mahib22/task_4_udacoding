import 'package:flutter/material.dart';
import 'package:task_4/pages/detail_gallery.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Future<List> getData() async {
    final response =
        await http.get("https://task4mahib.nasihosting.com/getGaleri.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text('Galeri Peternakan'),
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListGaleri(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListGaleri extends StatelessWidget {
  final List list;
  ListGaleri({this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(5),
          child: Card(
            child: Hero(
              tag: list[i]['img'],
              child: Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailGallery(
                          list: list,
                          index: i,
                        ),
                      ),
                    );
                  },
                  child: Image(
                    image: NetworkImage(
                        'https://task4mahib.nasihosting.com/images/' +
                            '${list[i]['img']}'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
