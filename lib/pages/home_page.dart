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
            pinned: true,
            title: Text("SLiverAppBar"),
          ),
          SliverPersistentHeader(
              delegate: HeaderDelegate(title: "Teste"),
            pinned: true,
          ),
          SliverFillRemaining()
        ],
      ),
    );
  }
}


class HeaderDelegate extends SliverPersistentHeaderDelegate{
  final String title;

  HeaderDelegate({required this.title});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(child: Text(title),),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}