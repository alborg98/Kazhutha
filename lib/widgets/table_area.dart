import 'package:flutter/material.dart';

class TableArea extends StatelessWidget {
  const TableArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green.shade700,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black45, width: 2),
      ),
      child: const Center(
        child: Text(
          '🃏 Deck',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
