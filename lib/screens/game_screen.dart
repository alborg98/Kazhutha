import 'package:flutter/material.dart';
import '../models/player_model.dart';      // For Player class and PlayerPosition enum
import '../models/deck_model.dart';        // For Deck class
import 'table_screen.dart';                // To navigate or return TableScreen widget

class _GameScreenState extends State<GameScreen> {
  late Player you, botTop, botLeft, botRight;
  late Deck deck;

  @override
  void initState() {
    super.initState();

    you = Player("You");
    botTop = Player("Top Bot");
    botLeft = Player("Left Bot");
    botRight = Player("Right Bot");

    deck = Deck();

    you.hand = deck.deal(6);
    botTop.hand = deck.deal(6);
    botLeft.hand = deck.deal(6);
    botRight.hand = deck.deal(6);
  }

  @override
  Widget build(BuildContext context) {
    final cardFontSize = MediaQuery.of(context).size.shortestSide * 0.06;

    return TableScreen(
      youHand: you.hand,
      botTopHand: botTop.hand,
      botLeftHand: botLeft.hand,
      botRightHand: botRight.hand,
      fontSize: cardFontSize,
    );
  }
}
