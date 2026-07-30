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
          SliverToBoxAdapter(
            child: /*Column(
              children: List.generate(100, (e) {
                print("e = $e");
                return Container(
                  height: 250,
                  color: Colors.pink,
                  margin: EdgeInsets.all(8),
                  child: Center(
                    child: Text(e.toString()),
                  ),
                );
              }
              ),
            ),*/ // non performant car elle charge tout en un coup
            Container(
              height: 128,
              color: Colors.blue,
              child: Center(
                child: Text("Mon header"),
              ),
            )
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              (context, index){
                print("elemet: $index");
                return ListTile(
                title: Text("element: $index"),
              );
                },
            childCount: 250
          ),
          )
        ],
      ),
    );
  }
}
