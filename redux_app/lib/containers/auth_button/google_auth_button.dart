import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedCallback;

  // Passed in from Container
  GoogleAuthButton({
    @required this.buttonText,
    this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    // Raised button is a widget that gives some
    // automatic Material design styles
    return new RaisedButton(
      onPressed: onPressedCallback,
      color: Colors.white,
      child: new Container(
        // Explicitly set height
        // Contianer has many options you can pass it,
        // Most widgets do *not* allow you to explicitly set
        // width and height
        width: 230.0,
        height: 50.0,
        alignment: Alignment.center,
        // Row is a layout widget
        // that lays out its children on a horizontal axis
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding is a convenience widget that adds Padding to it's child
            new Padding(
              padding: const EdgeInsets.only(right: 20.0),
              // Image, like everyhting, is just a class.
              // This constructor expects an image URL -- I found this one on Google
              child: new Image.network(
                'http://diylogodesigns.com/blog/wp-content/uploads/2016/04/google-logo-icon-PNG-Transparent-Background.png',
                width: 30.0,
              ),
            ),
            new Text(
              buttonText,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
