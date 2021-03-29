import 'package:flutter/material.dart';

class DetailGallery extends StatefulWidget {
  final List list;
  final int index;
  DetailGallery({this.index, this.list});

  @override
  _DetailGalleryState createState() => _DetailGalleryState();
}

class _DetailGalleryState extends State<DetailGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
        title: Text("${widget.list[widget.index]['judul']}"),
      ),
      body: ListView(
        children: [
          Container(
            height: 240,
            child: Hero(
              tag: widget.list[widget.index]['img'],
              child: Material(
                child: InkWell(
                  child: Image(
                    image: NetworkImage(
                        'https://task4mahib.nasihosting.com/images/' +
                            '${widget.list[widget.index]['img']}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              widget.list[widget.index]['judul'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.list[widget.index]['deskripsi'],
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
