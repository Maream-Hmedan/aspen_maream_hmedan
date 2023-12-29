import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
  List<String> _list1 = ["Apple", "Banana", "Cherry", "Date", "Grapes"];
  List<String> _list2 = ["Aardvark", "Bat", "Cheetah", "Dog", "Giraffe"];
  List<String> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    // Start with the combined list when the widget is first created
    _filteredResults.addAll(_list1);
    _filteredResults.addAll(_list2);
  }

  void _filterLists(String query) {
    _filteredResults.clear();
    _list1.forEach((item) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        _filteredResults.add(item);
      }
    });

    _list2.forEach((item) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        _filteredResults.add(item);
      }
    });

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
                  title: Text(_filteredResults[index]),
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
