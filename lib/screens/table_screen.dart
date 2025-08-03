import 'package:flutter/material.dart';
import '../widgets/player_hand.dart';     // For the PlayerHand widget
import '../widgets/table_area.dart';      // For the TableArea widget in the center
import '../models/player_model.dart';     // For PlayerPosition enum or class

class TableScreen extends StatelessWidget {
  final List<String> youHand;
  final List<String> botTopHand;
  final List<String> botLeftHand;
  final List<String> botRightHand;
  final double fontSize;

  const TableScreen({
    super.key,
    required this.youHand,
    required this.botTopHand,
    required this.botLeftHand,
    required this.botRightHand,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Top player
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PlayerHand(
                  position: PlayerPosition.top,
                  cards: botTopHand,
                  fontSize: fontSize,
                ),
              ),

              // Middle section
              Expanded(
                child: Row(
                  children: [
                    // Left player
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: PlayerHand(
                        position: PlayerPosition.left,
                        cards: botLeftHand,
                        fontSize: fontSize,
                      ),
                    ),

                    // Table and deck in center
                    Expanded(
                      child: Center(
                        child: TableArea(),
                      ),
                    ),

                    // Right player
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: PlayerHand(
                        position: PlayerPosition.right,
                        cards: botRightHand,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom player (you)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: PlayerHand(
                  position: PlayerPosition.bottom,
                  cards: youHand,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

