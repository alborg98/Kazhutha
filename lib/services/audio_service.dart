import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioService {
  static final AudioPlayer _bgmPlayer = AudioPlayer();
  static final AudioPlayer _sfxPlayer = AudioPlayer();

  static bool _isMuted = false;

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isMuted = prefs.getBool('isMuted') ?? false;
  }

  Future<void> playBgm() async {
    if (_isMuted) return;
    await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
    await _bgmPlayer.play(AssetSource('sounds/bgm_loop_song.mp3'));
  }

  Future<void> playDonkey() async {
    if (_isMuted) return;
    await _sfxPlayer.play(AssetSource('sounds/donkey.mp3'));
  }

  static Future<void> toggleMute() async {
    final prefs = await SharedPreferences.getInstance();
    _isMuted = !_isMuted;
    await prefs.setBool('isMuted', _isMuted);
    if (_isMuted) {
      _bgmPlayer.stop();
    } else {
      _bgmPlayer.play(AssetSource('sounds/bgm_loop_song.mp3'), volume: 1, mode: PlayerMode.mediaPlayer);
    }
  }

  static bool get isMuted => _isMuted;
}
