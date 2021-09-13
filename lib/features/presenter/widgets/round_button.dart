import 'package:flutter/material.dart';

class RoundButtom extends StatelessWidget {
  final String label;
  final Function onTap;

  const RoundButtom({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).buttonColor,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.button,
        ),
      ),
      onTap: onTap as Function(),
    );
  }
}
