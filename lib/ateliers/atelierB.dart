import 'package:flutter/material.dart';

class SpotifyPage extends StatelessWidget {
  const SpotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          // 1. SliverApp
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            stretch: true,
            backgroundColor: Color(0xFF202020),
            flexibleSpace:  FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Tecno Bunker",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("assets/album.jpeg", fit: BoxFit.cover,),
                  DecoratedBox(decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color(0xFF121212)
                          ]
                      )
                  ),
                  )
                ],
              ),
            ),

          ),


          // 2. SliverList
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index){
                    return ListTile(
                      // premier element de nos liste
                      leading: Text("${index+1}", style: TextStyle(color: Colors.grey)),
                      // title
                      title: Text("Soound $index", style: TextStyle(color: Colors.white),),
                      // le soustitre
                      subtitle: Text("Various Artistes", style: TextStyle(color: Colors.grey)),
                      // la fin de la liste (l'icon des trois points)
                      trailing: Icon(Icons.more_vert, color: Colors.grey,),
                    );
                  }, childCount: 25
              )
          )
        ],
      ),
    );
  }
}
