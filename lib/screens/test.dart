import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Item {
  final String name;
  final String image;

  Item({required this.name, required this.image});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  List<Item> _list1 = [
    Item(name: "Apple", image: "apple_image_url"),
    Item(name: "Banana", image: "banana_image_url"),
    Item(name: "Cherry", image: "cherry_image_url"),
    // Add more items as needed
  ];

  List<Item> _list2 = [
    Item(name: "Aardvark", image: "aardvark_image_url"),
    Item(name: "Banana", image: "banana_image_url"),
    Item(name: "Cheetah", image: "cheetah_image_url"),
    // Add more items as needed
  ];

  List<Item> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    // Show all items initially
    _filteredResults.addAll(_list1);
    _filteredResults.addAll(_list2);
  }

  void _filterLists(String query) {
    _filteredResults.clear();

    if (query.isEmpty) {
      // Show all items if the query is empty
      _filteredResults.addAll(_list1);
      _filteredResults.addAll(_list2);
    } else {
      // Filter the lists based on the entered query
      _filteredResults.addAll(_list1.where((item) =>
          item.name.toLowerCase().contains(query.toLowerCase())));
      _filteredResults.addAll(_list2.where((item) =>
          item.name.toLowerCase().contains(query.toLowerCase())));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Lists Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              onChanged: (query) {
                _filterLists(query);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter a keyword',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: _filteredResults.isNotEmpty
                ? ListView.builder(
              itemCount: _filteredResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredResults[index].name),
                  leading: Image.network(_filteredResults[index].image),
                );
              },
            )
                : Center(
              child: Text("No matching results"),
            ),
          ),
        ],
      ),
    );
  }
}
