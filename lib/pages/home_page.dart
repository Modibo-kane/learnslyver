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
              delegate: HeaderDelegate(title: "Teste", min: 24, max: 500 ),
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
  final double max;
  final double min;

  HeaderDelegate({
    required this.title,
    required this.max,
    required this.min
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final opacity = (shrinkOffset / maxExtent).clamp(0, 1);
    return Container(
      color: Colors.lightGreenAccent.withAlpha((opacity * 255).toInt()),
      child: Center(
        child: Column(
          children: [
            Text(shrinkOffset.toString())
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => max;

  @override
  // TODO: implement minExtent
  double get minExtent => min;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}