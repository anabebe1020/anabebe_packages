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
    _logger.setup('ImageTestPage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.log('build');

    const space = SizedBox(height: 20);
    const textStyle = TextStyle(fontSize: 18);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('w100 * h80', style: textStyle),
            space,

            /// no boxFit
            const Text('no boxFit', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
            ),
            space,

            /// fitWidth
            const Text('fitWidth', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
              boxFit: BoxFit.fitWidth,
            ),
            space,

            /// scaleDown
            const Text('scaleDown', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
              boxFit: BoxFit.scaleDown,
            ),
            space,

            /// fill
            const Text('fill', style: textStyle),
            GeneralNetworkImage(
              height: 80,
              width: 100,
              imageUrl: _imageUrl1,
              boxFit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
