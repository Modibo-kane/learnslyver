import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Contenu de votre page Instagram
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Mon AppBar"),
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index){
                    return ListTile(
                      title: Text("Element de liste: $index"),
                    );
                  }, childCount: 40,
              )
          )
        ],
      ),
    );
  }
}