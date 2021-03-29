import 'package:flutter/material.dart';

class DetailBerita extends StatefulWidget {
  final List list;
  final int index;
  DetailBerita({this.index, this.list});

  @override
  _DetailBeritaState createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
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
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.list[widget.index]['isi'],
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: Text(
                'WRITEN BY',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                widget.list[widget.index]['author'],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Text(
                widget.list[widget.index]['tgl'],
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
