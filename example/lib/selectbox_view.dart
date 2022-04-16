import 'package:anabebe_packages/anabebe_packages.dart';
import 'package:flutter/material.dart';

class SelectBoxTestPage extends StatefulWidget {
  const SelectBoxTestPage({Key? key}) : super(key: key);

  @override
  State<SelectBoxTestPage> createState() => _SelectBoxTestPageState();
}

class _SelectBoxTestPageState extends State<SelectBoxTestPage> {
  late Logger _logger;

  late List<String> _items;
  late String _currentItem;

  @override
  initState() {
    _items = ['0', '1', '2', '3'];
    _currentItem = _items.first;

    ///
    _logger = Logger();
    _logger.setup('TestView');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.log('build');

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SelectBox(
              items: _items,
              currentItem: _currentItem,
              onChanged: (_) {},
            )
          ],
        ),
      ),
    );
  }
}
