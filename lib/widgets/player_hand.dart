
import 'package:flutter/material.dart';
import '../models/player_model.dart'; // this brings in PlayerPosition

class PlayerHand extends StatelessWidget {
  final PlayerPosition position;
  final List<String> cards;
  final double fontSize;

  const PlayerHand({
    super.key,
    required this.position,
    required this.cards,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final isHorizontal = position == PlayerPosition.top || position == PlayerPosition.bottom;
    final spacing = isHorizontal ? 4.0 : 2.0;

    final cardWidgets = cards
        .map((card) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isHorizontal ? spacing : 0,
                vertical: isHorizontal ? 0 : spacing,
              ),
              child: Text(
                card,
                style: TextStyle(fontSize: fontSize),
              ),
            ))
        .toList();

    return isHorizontal
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cardWidgets,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cardWidgets,
          );
  }
}
