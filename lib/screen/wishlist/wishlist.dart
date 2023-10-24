import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/Home.dart';



class HomeScreen extends StatefulWidget {
  AnaEkran createState() => AnaEkran();
}


class AnaEkran extends State<HomeScreen> {

  List<String> mainDataList = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];

  List<String> favoriteDataList = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('NickName Generator'),
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.article_rounded)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: mainDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            mainDataList[index],
                            style: const TextStyle(fontSize: 19.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            favoriteDataList.add(mainDataList[index]);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurple,
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            favoriteDataList.isEmpty
                ? const Center(
              child: Text(
                'There are no favorites yet!',
                style: TextStyle(color: Colors.black),
              ),
            )
                : ListView.builder(
              itemCount: favoriteDataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            favoriteDataList[index],
                            style: const TextStyle(fontSize: 19.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            favoriteDataList
                                .remove(favoriteDataList[index]);
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                            Colors.deepPurple,
                          ),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}