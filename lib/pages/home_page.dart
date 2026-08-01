import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Contenu de votre page Instagram
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            // title: Text("Mon AppBar"),
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            pinned: true,
            collapsedHeight: kToolbarHeight,
            expandedHeight: 200,
            floating: true,
            snap: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Ici on est flexible", style: TextStyle(color: Colors.white),),
              background: Image.asset("assets/blogBg.webp", fit: BoxFit.cover,),
              stretchModes: [
                // StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
            ),
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