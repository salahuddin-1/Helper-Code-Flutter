import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _buildBlurContainer(context),
      ),
    );
  }

  Widget _buildBlurContainer(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.orange.withOpacity(0.8),
    );
  }
}
