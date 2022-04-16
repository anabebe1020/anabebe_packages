import 'package:anabebe_packages/anabebe_packages.dart';
import 'package:flutter/material.dart';

class FullScreenImageTestPage extends StatefulWidget {
  const FullScreenImageTestPage({Key? key}) : super(key: key);

  @override
  State<FullScreenImageTestPage> createState() =>
      _FullScreenImageTestPageState();
}

class _FullScreenImageTestPageState extends State<FullScreenImageTestPage> {
  final _logger = Logger();

  final _imageUrl1 =
      'https://naokeyzmt.com/rogue/wp-content/themes/rogue/assets/images/articles/skillup/2021/flutter/may/22/skillup-flutter-beginwindows.jpg';

  @override
  initState() {
    _logger.setup('FullScreenImageTestPage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.log('build');

    const space = SizedBox(height: 20);
    const textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GeneralNetworkImage'),
        titleTextStyle: const TextStyle(fontSize: 18.0, color: Colors.blueGrey),
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: FullScreenImage(url: _imageUrl1),
      ),
    );
  }
}
