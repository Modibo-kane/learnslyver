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
          // 1. SliverAppBar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            stretch: true,
            backgroundColor: Color(0xff202020),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Techno Bunker",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
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
                  DecoratedBox(
                    decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFF121212)
                    ])
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
                      leading: Text("${index + 1}",style: TextStyle(color: Colors.grey)),
                      title: Text("Track Title $index", style: TextStyle(color: Colors.white),),
                      subtitle: Text("Various Artistes,", style: TextStyle(color: Colors.grey)),
                      trailing: Icon(Icons.more_vert, color: Colors.grey),
                    );
                  }, childCount: 25
              )
          )
        ],
      ),
    );
  }
}
