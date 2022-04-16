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
    _items = ['0', '1', '2', '3'];
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
            const Text('normal', style: textStyle),
            SelectBox(
              height: 40,
              width: 200,
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            ),
            space,
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
            const Text('disable', style: textStyle),
            SelectBox(
              height: 40,
              width: 200,
              disable: true,
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
