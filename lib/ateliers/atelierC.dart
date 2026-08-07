import 'package:flutter/material.dart';

class Airbnb extends StatelessWidget {
  const Airbnb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 1.header
          SliverPersistentHeader(
            pinned: true,
              delegate: _AirBnbHeaderDelegate()
          ),

          // 2. Contenue
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text("Chambre privée dans un loft - Bamako",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text("2 voyageurs . 1 chambre . 1 lit . 1 salle de bain"),
                  Divider(height: 40,),
                  Row(
                    children: [
                      Icon(Icons.star, size: 18,),
                      Text("4,92", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 10,),
                      Text("128 commentaires", style: TextStyle(
                        decoration: TextDecoration.underline
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  for(var i = 0; i < 20; i++)
                    ListTile(title: Text("Equipement $i"),
                      leading: Icon(Icons.check),
                    )
                ])
            ),
          )
        ],
      ),
    );
  }
}


// 3. Delegation

class _AirBnbHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   final percent = shrinkOffset / ( maxExtent - minExtent);
   final clampedPercent = percent.clamp(0, 1);

   return Container(
     color: Colors.white.withAlpha((clampedPercent * 255).toInt()),
     child: Stack(
       fit: StackFit.expand,
       children: [
         Opacity(
             opacity: 1.0 - clampedPercent,
           child: Image.network("https://images.unsplash.com/photo-1502672260266-1c1ef2d93688", fit: BoxFit.cover,),
         ),
         Positioned(
           top: 40,
           left: 20,
           right: 20,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               _builderCirculButton(Icons.arrow_back, clampedPercent.toDouble()),
               Row(
                 children: [
                   _builderCirculButton(Icons.share, clampedPercent.toDouble()),
                   SizedBox(width: 10,),
                   _builderCirculButton(Icons.favorite_border, clampedPercent.toDouble()),
                 ],
               )
             ],
           ),
         )
       ],
     ),
   );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 300;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }


  Widget _builderCirculButton(IconData icon, double percent){
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withAlpha(((1 - percent).clamp(0, 0.9) * 255).round())
      ),
      child: Icon(icon, color: Colors.black, size: 20,),
    );
  }
}