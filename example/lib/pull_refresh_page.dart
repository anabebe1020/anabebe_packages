import 'package:anabebe_packages/anabebe_packages.dart';
import 'package:flutter/material.dart';

class PullRefreshScrollViewTestPage extends StatefulWidget {
  const PullRefreshScrollViewTestPage({Key? key}) : super(key: key);

  @override
  State<PullRefreshScrollViewTestPage> createState() =>
      _PullRefreshScrollViewTestPageState();
}

class _PullRefreshScrollViewTestPageState
    extends State<PullRefreshScrollViewTestPage> {
  final _logger = Logger();
  int _currentIndex = 0;
  final _items = ['0'];
  double _currentPosition = 0.0;

  /// set ScrollController
  final _controller = ScrollController();

  @override
  initState() {
    _logger.setup('PullRefreshScrollViewTestPage');
    _controller.addListener(() {
      setState(() {
        _currentPosition = _controller.position.pixels;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.log('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('PullRefreshScrollView'),
        titleTextStyle: const TextStyle(fontSize: 18.0, color: Colors.blueGrey),
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: PullRefreshScrollView(
        // Use as ScrollView
        scrollController: _controller,
        child: ListView.separated(
          itemBuilder: (context, index) => _listItem(_items[index]),
          separatorBuilder: (context, index) => const Divider(height: 0.5),
          itemCount: _items.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
        onRefresh: () async {
          _clearItem();
        },
      ),
      bottomSheet: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text('scroll position: ${_currentPosition.toStringAsFixed(1)}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _addItem(),
      ),
    );
  }

  void _addItem() {
    setState(() {
      _currentIndex++;
      _items.add(_currentIndex.toString());
    });
  }

  void _clearItem() {
    _currentIndex = 0;
    _items.clear();
    _items.add(_currentIndex.toString());
  }

  Widget _listItem(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 40,
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}
