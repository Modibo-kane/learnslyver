import 'package:flutter/material.dart';

class InstagramExplore extends StatelessWidget {
  const InstagramExplore({super.key});

  @override
  Widget build(BuildContext context) {
    // Contenu de votre page Instagram
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 50, 16, 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.search_outlined),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Rechercher',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(bottom: 6),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index){
                      return Container(
                        color: Colors.grey[300],
                        child: Image.network(
                          "https://picsum.photos/id/${index + 10}/200/200",
                          fit: BoxFit.cover,
                        ),
                      );
                    }, childCount: 18
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 1
                ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.all(16),
              child: Text(
                "Suggestion d'amis ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index){
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage("https://i.pravatar.cc/150?u=$index"),
                      ),
                      title: Text("Utilisateur_$index"),
                      trailing: TextButton(
                          onPressed: (){},
                          child: Text(
                              "Suivre",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold
                          ),)
                      ),
                    );
                  }, childCount: 25
              )
          )
        ],
      ),
    );
  }
}