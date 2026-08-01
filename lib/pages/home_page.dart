import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {

    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  late ScrollController _controller;
  bool _isCollapsed = false;

  @override
  void initState(){
    super.initState();

    _controller = ScrollController()
    ..addListener((){
       double threshold = 128.0;
       if( _controller.offset < threshold && !_isCollapsed){
         setState(() {
           _isCollapsed = true;
         });
       } else if(_controller.offset <= threshold && _isCollapsed){
         setState(() {
           _isCollapsed = false;
         });
       }
    });
  }

  // @override
  // void dispose() {
  //   // Toujours libérer le contrôleur pour éviter les fuites de mémoire
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Contenu de votre page Instagram
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title:  _isCollapsed ? Text("Mon AppBar") : null,
            backgroundColor: Colors.lightGreen,
            centerTitle: true,
            pinned: true,
            collapsedHeight: kToolbarHeight,
            expandedHeight: 250,
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
          SliverFillRemaining(
            // c'est un element qui permet de remplir l'espace restant
            child: Center(
              child: Text(_isCollapsed ? "Ouvert": "Femer"),
            ),
          )
        ],
      ),
    );
  }
}