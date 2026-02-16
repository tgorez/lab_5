import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Laboratory Work 5",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 173, 53, 105)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.tab), text: "TabBar"),
              Tab(icon: Icon(Icons.list), text: "ListView"),
              Tab(icon: Icon(Icons.grid_view), text: "GridView"),
              Tab(icon: Icon(Icons.credit_card), text: "Cards"),
              Tab(icon: Icon(Icons.menu), text: "Drawer"),
              Tab(icon: Icon(Icons.notifications), text: "Toast"),
            ],
          ),
        ),

        drawer: Builder(
          builder: (context) => Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.pink),
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                drawerItem(context, "Home"),
                drawerItem(context, "Profile"),
                drawerItem(context, "Settings"),
                drawerItem(context, "Logout"),
              ],
            ),
          ),
        ),

        body: TabBarView(
          children: [
            Task1List(),       
            ListViewTab(),     
            GridViewTab(),     
            CardsTab(),        
            DrawerInfoTab(),   
            ToastTab(),       
          ],
        ),
      ),
    );
  }

  static ListTile drawerItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title selected")),
        );
      },
    );
  }
}

class Task1List extends StatelessWidget {
  const Task1List({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.circle),
          title: Text("Item ${index + 1}"),
        );
      },
    );
  }
}

class ListViewTab extends StatelessWidget {
  const ListViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.square),
          title: Text("Title ${index + 1}"),
          subtitle: Text("Subtitle ${index + 1}"),
        );
      },
    );
  }
}

class GridViewTab extends StatelessWidget {
  const GridViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(10),
      children: List.generate(6, (index) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.primaries[index],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CardsTab extends StatelessWidget {
  const CardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        CustomCard(
          imagePath: "assets/images/bmw.jpg",
          title: "BMW",
          description: "BMW is about sportiness, driving performance, and the joy of driving.",
        ),
        CustomCard(
          imagePath: "assets/images/merc.jpg",
          title: "Mercedes",
          description: "Mercedes-Benz is about prestige, technology, and maximum comfort.",
        ),
        CustomCard(
          imagePath: "assets/images/lex.jpg",
          title: "Lexus",
          description: "Lexus is about comfort, reliability, and smooth ride quality.",
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(title,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Text(description),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class DrawerInfoTab extends StatelessWidget {
  const DrawerInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Open the Drawer from top-left menu",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class ToastTab extends StatelessWidget {
  const ToastTab({super.key});

  void showToast() {
    Fluttertoast.showToast(
      msg: "Hello, Flutter!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: showToast,
        child: const Text("Show Toast"),
      ),
    );
  }
}