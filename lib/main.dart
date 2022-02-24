import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Issue',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dropdown Issue'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _src = [
    "This is short item",
    "This is a medium medium medium medium medium medium medium item",
    "This is a super long long long long long long long long long long long long long long long long long long long long long long item"
  ];

  String _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.3,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton(
                value: _selectedItem,
                isExpanded: true,
                isDense: false,
                hint: Text("Please pick one"),
                icon: const Icon(Icons.keyboard_arrow_down),
                elevation: 8,
                underline: Container(),
                onChanged: (String newValue) {
                  print("newValue is $newValue");
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
                items: _src.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
