import 'package:flutter/material.dart';

class StaticMap extends StatefulWidget {
  final List markers;
  final Map currentLocation;
  final String googleMapsApiKey;
  final int width;
  final int height;
  final int zoom;

  StaticMap(this.googleMapsApiKey,
      {this.markers, this.width, this.height, this.currentLocation, this.zoom});
  @override
  _StaticMapState createState() => new _StaticMapState();
}

class _StaticMapState extends State<StaticMap> {
  String startUrl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Solid_white.svg/2000px-Solid_white.svg.png';
  String nextUrl;
  static const int defaultWidth = 600;
  static const int defaultHeight = 400;
  Map<String, String> defaultLocation = {
    "latitude": '37.0902',
    "longitude": '-95.7192'
  };

  _buildUrl(Map currentLocation, List locations, int width, int height) {
    var finalUri;
    var baseUri = new Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        port: 443,
        path: '/maps/api/staticmap',
        queryParameters: {});

    if (currentLocation != null && widget.markers.length == 0) {
      // just center the map on the users location
      finalUri = baseUri.replace(queryParameters: {
        'center':
            '${currentLocation['latitude']},${currentLocation['longitude']}',
        'zoom': widget.zoom.toString(),
        'size': '${width ?? defaultWidth}x${height ?? defaultHeight}',
        '${widget.googleMapsApiKey}': ''
      });
    } else {
      List<String> markers = new List();
      // Add a blue marker for the user
      var userLat = currentLocation['latitude'];
      var userLng = currentLocation['longitude'];
      String marker = '$userLat,$userLng';
      markers.add(marker);
      // Add a red marker for each location you decide to add
      widget.markers.forEach((location) {
        var lat = location['latitude'];
        var lng = location['longitude'];
        String marker = '$lat,$lng';
        markers.add(marker);
      });
      String markersString = markers.join('|');
      finalUri = baseUri.replace(queryParameters: {
        'markers': markersString,
        'size': '${width ?? defaultWidth}x${height ?? defaultHeight}',
        '${widget.googleMapsApiKey}': ''
      });
    }
    setState(() {
      startUrl = nextUrl ?? startUrl;
      nextUrl = finalUri.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentLocation = widget.currentLocation;
    if (widget.currentLocation == null) {
      currentLocation = defaultLocation;
    }
    _buildUrl(currentLocation, widget.markers, widget.width ?? defaultWidth,
        widget.height ?? defaultHeight);
    return new Container(
        child: new FadeInImage(
      placeholder: new NetworkImage(startUrl),
      image: new NetworkImage(nextUrl),
    ));
  }
}
