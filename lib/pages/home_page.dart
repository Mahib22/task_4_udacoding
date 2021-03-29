import 'package:flutter/material.dart';

import './berita_page.dart' as berita;
import './gallery_page.dart' as gallery;
import './search_page.dart' as search;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          berita.BeritaPage(),
          search.SearchPage(),
          gallery.GalleryPage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.cyan,
        child: TabBar(
          indicatorColor: Colors.white,
          controller: controller,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.photo_library,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
