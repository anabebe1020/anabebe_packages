import 'package:anabebe_packages/anabebe_packages.dart';
import 'package:flutter/material.dart';

class SelectBoxTestPage extends StatefulWidget {
  const SelectBoxTestPage({Key? key}) : super(key: key);

  @override
  State<SelectBoxTestPage> createState() => _SelectBoxTestPageState();
}

class _SelectBoxTestPageState extends State<SelectBoxTestPage> {
  final _logger = Logger();

  late List<String> _items;
  late String _currentItem;

  @override
  initState() {
    /// set items
    _items = ['0', '1', '2', '3'];

    /// set currentItem
    _currentItem = _items.first;

    _logger.setup('TestView');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.log('build');

    const space = SizedBox(height: 30);
    const textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// general usage
            const Text('normal', style: textStyle),
            SelectBox(
              height: 40,
              width: 200,
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            ),
            space,

            /// change the color of an item
            const Text('foreground color red', style: textStyle),
            SelectBox(
              height: 40,
              width: 200,
              foregroundColor: Colors.red,
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            ),
            space,

            /// change the color of a border
            const Text('border color blue', style: textStyle),
            SelectBox(
              height: 40,
              width: 200,
              borderColor: Colors.blue,
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            ),
            space,

            /// make the box disable.
            const Text('disable', style: textStyle),
            SelectBox(
              height: 40,
              width: 200,
              disable: true,
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            ),
            space,

            /// change the size of box
            const Text('size change', style: textStyle),
            SelectBox(
              height: 30,
              width: 120,
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            ),
            space,
            SelectBox(
              height: 60,
              width: 300,
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
