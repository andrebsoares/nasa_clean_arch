import 'package:flutter/material.dart';

class ImageNetworkWithLoader extends StatelessWidget {
  final String url;

  const ImageNetworkWithLoader({required this.url});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 0.1,
      maxScale: 4.0,
      child: Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? (loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
