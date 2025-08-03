import 'package:flutter/material.dart';
import 'package:kazhutha_game/services/audio_service.dart';

class MuteButton extends StatefulWidget {
  const MuteButton({super.key});

  @override
  State<MuteButton> createState() => _MuteButtonState();
}

class _MuteButtonState extends State<MuteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Text(
        AudioService.isMuted ? '🔇' : '🔊',
        style: const TextStyle(fontSize: 28),
      ),
      onPressed: () async {
        await AudioService.toggleMute();
        setState(() {});
      },
    );
  }
}
