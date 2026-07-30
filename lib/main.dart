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
      body:CustomScrollView(
        slivers: [
          SliverPadding(
              padding:EdgeInsets.all(8),
              sliver: SliverList(delegate: SliverChildBuilderDelegate(
                  (context, i)=> ListTile(
                      title: Text("Coucou $i"),
                    ),
                    childCount: 12

              ),

              ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
                  (context, i){
                print("coucou $i");
                return ListTile(
                  title: Text("Hello $i"),
                );
              }
          ),
          ),
        ],
      ),
    );
  }
}
