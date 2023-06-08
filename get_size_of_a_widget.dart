import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  final String textFromApi;

  MyWidget({required this.textFromApi});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final GlobalKey _containerKey = GlobalKey();

  Size? _containerSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getContainerSize();
    });
  }

  void _getContainerSize() {
    final containerRenderBox = _containerKey.currentContext?.findRenderObject() as RenderBox?;
    if (containerRenderBox != null) {
      setState(() {
        _containerSize = containerRenderBox.size;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_containerSize?.height);
    return Container(
      key: _containerKey,
      child: Text(
        // String from the API
        "ab84783479837437489439dshdhsdd767773654473843gfhegfgehfgeyfgyegregrtertertyuetryuetyrteyuru34343433j",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
