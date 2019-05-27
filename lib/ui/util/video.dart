import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VideoWidget extends StatefulWidget {
  final String img;
  final String title;
  final GestureTapCallback onTap;
  final width;
  final height;
  final padding;

  const VideoWidget(
      {Key key,
      this.padding,
      this.height,
      this.width,
      this.img,
      this.title,
      this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VideoWidgetState();
  }
}

class VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    final widget = this.widget;

    final imgW = (widget.width * window.devicePixelRatio).toInt().toString();
    final imgH = (widget.height * window.devicePixelRatio).toInt().toString();

    return Focus(
        autofocus: true,
        child: Builder(builder: (BuildContext context) {
          final FocusNode focusNode = Focus.of(context);
          final bool hasFocus = focusNode.hasFocus;

          Color color;
          double radius;
          Color boxColor;
          Color borderColor;

          if (hasFocus) {
            color = Colors.yellow;
            radius = 3;
            boxColor = Colors.yellow;
            borderColor = Colors.black;
          } else {
            color = Colors.grey;
            radius = 0;
            boxColor = Colors.transparent;
            borderColor = Colors.black12;
          }

          return GestureDetector(
              onTap: () {
                focusNode.requestFocus();
              },
              child: Column(children: <Widget>[
                Container(
                    width: widget.width,
                    margin: EdgeInsets.only(bottom: widget.padding),
                    height: widget.height,
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor, width: 1),
                      color: Colors.black12,
                      boxShadow: [
                        BoxShadow(
                          color: boxColor,
                          spreadRadius: radius,
                          blurRadius: radius,
                          offset: const Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: CachedNetworkImage(
                        width: widget.width,
                        height: widget.height,
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://tv.ucommuner.com/${widget.img}?imageView2/1/w/$imgW/h/$imgH/format/webp",
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error))),
                Container(
                    width: widget.width,
                    child: Text(widget.title,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: color),
                        overflow: TextOverflow.ellipsis))
              ]));
        }));
  }
}
