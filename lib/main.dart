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
        // Direction du scroll
        scrollDirection: Axis.vertical,
        // Pré-rendu c'est a dire ce qui est visible ou le sera prochainement par l'utilisateur
        scrollCacheExtent: ScrollCacheExtent.pixels(250),
      //   Point de depart
        anchor: 1,
      //   mettre en place les slivers
        slivers: [
          const SliverAppBar(
            title: Text("Le viewport voit tout "),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            print("Construction de l'élement $index");
            return ListTile(
              title: Text("Element numéro: $index"),
            );
          },
            childCount: 200 // le nomvre de sliver que j'affiche.
          ),
          ),
        ],
      ),
    );
  }
}


