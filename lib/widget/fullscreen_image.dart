import 'package:flutter/material.dart';

import 'general_network_image.dart';

class FullScreenImage extends StatefulWidget {
  final String url;
  const FullScreenImage({Key? key, required this.url}) : super(key: key);

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  final _frontIconSize = 20.0;
  final _backIconSize = 25.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          alignment: Alignment.center,
          color: Colors.grey,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              InteractiveViewer(
                minScale: 0.01,
                maxScale: 5,
                child: GeneralNetworkImage(
                  height: double.infinity,
                  imageUrl: widget.url,
                  boxFit: BoxFit.fitWidth,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(24, 48, 0, 0),
                child: InkWell(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.brightness_1,
                        color: Colors.black.withOpacity(0.5),
                        size: _backIconSize,
                      ),
                      Icon(
                        Icons.clear_rounded,
                        color: Colors.grey,
                        size: _frontIconSize,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
