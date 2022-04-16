import 'package:anabebe_packages/anabebe_packages.dart';
import 'package:example/selectbox_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'anabebe_packages_demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TestHomePage(),
    );
  }
}

class TestHomePage extends StatefulWidget {
  const TestHomePage({Key? key}) : super(key: key);

  @override
  State<TestHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestHomePage> {
  int _currentIndex = 0;
  final _pageController = PageController();
  late List<Widget> _pageList = [];

  /// get instance
  final _logger = Logger();

  @override
  void initState() {
    _pageList = [
      const SelectBoxTestPage(),
      const SelectBoxTestPage(),
    ];

    /// set domain(page) name
    _logger.setup('main');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('anabebe_packages Test View'),
        titleTextStyle: const TextStyle(fontSize: 18.0, color: Colors.blueGrey),
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          _logger.log('onPageChanged $index');
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'SelectBox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Image',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _logger.log('onTap $index');
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
