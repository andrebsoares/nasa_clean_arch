import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDescriptionBottomSheet({
  required BuildContext context,
  required String title,
  required String description,
}) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
