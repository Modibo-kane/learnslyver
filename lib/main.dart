import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter demo",
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /*SliverToBoxAdapter(
            child: Column(
              children: [
                Text("Est ce que cela fonctionne ? ")
              ],
            ),
          /* ici on a vue que pour metttre un Column dans un sliver, il faut
          le mettre dans un SliverToBoxAdapter d'abord sinon il y aura une
          erreur fatal .*/
          )*/

          /*SliverToBoxAdapter(
              child:ListView.builder(
                itemCount: 25,
                itemBuilder: ((context, index){
                  ListTile(title: Text("index: $index"),
                  );
                }),
              )
          )
          /*ici il est dit que vue que un SliverToBoxAdapter a une taille infini,
           et quand on essaye d'y mettre une ListView.builder qui
           repartie ses enfant en fonction de l'espace de son parent,
            il va se produire une erreur ded calcule car
            le ListView.builder essaye de calculer un espace infini
            a partager entre ces enfant*/
          */
          //solution 1
          /*SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                  title: Text("index: $index")),
              childCount: 25
            ),
          ),*/

          // solution 2 cas de force majeur ( depannage )
          SliverToBoxAdapter(
              child:ListView.builder(
                shrinkWrap: true, // forcer a prendre la taille
                  physics: NeverScrollableScrollPhysics(), // desacativer le sroll interne (celui de ListView.builder )
                itemCount: 25,
                itemBuilder: ((context, index)=>
                  ListTile(title: Text("index: $index"),
                  )
                ),
              )
          )
        ],
      )
    );
  }
}


