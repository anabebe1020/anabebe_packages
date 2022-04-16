import 'package:anabebe_packages/anabebe_packages.dart';
import 'package:flutter/material.dart';

class NetworkImageTestPage extends StatefulWidget {
  const NetworkImageTestPage({Key? key}) : super(key: key);

  @override
  State<NetworkImageTestPage> createState() => _NetworkImageTestPageState();
}

class _NetworkImageTestPageState extends State<NetworkImageTestPage> {
  final _logger = Logger();

  final _imageUrl1 =
      'https://naokeyzmt.com/rogue/wp-content/themes/rogue/assets/images/articles/skillup/2021/flutter/may/22/skillup-flutter-beginwindows.jpg';

  @override
  initState() {
    _logger.setup('GeneralNetworkImageTestPage');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('h80 * w100', style: textStyle),
            space,

            /// no boxFit
            const Text('no boxFit', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
              onTap: () => pushFullScreenModal(),
            ),
            space,

            /// fitWidth
            const Text('fitWidth', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
              boxFit: BoxFit.fitWidth,
              onTap: () => pushFullScreenModal(),
            ),
            space,

            /// scaleDown
            const Text('scaleDown', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
              boxFit: BoxFit.scaleDown,
              onTap: () => pushFullScreenModal(),
            ),
            space,

            /// fill
            const Text('fill', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
              boxFit: BoxFit.fill,
              onTap: () => pushFullScreenModal(),
            ),
            space,

            const Text('touch to display FullScreenImage', style: textStyle),
          ],
        ),
      ),
    );
  }

  void pushFullScreenModal() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullScreenImage(url: _imageUrl1),
        settings: const RouteSettings(name: 'FullScreenImage'),
        fullscreenDialog: true,
      ),
    );
  }
}
