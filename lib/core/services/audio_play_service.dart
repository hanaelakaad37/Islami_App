import 'package:audioplayers/audioplayers.dart';

class AudioPlayService {
  final player = AudioPlayer();
  String? currentURL;

  bool isPlaying = false;

  double currentVolume = 1;

  /// play
  ///
  Future<void> play(String url) async {
    if (currentURL == url) {
      isPlaying ? await player.pause() : player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentURL = url;
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
  }

  /// stop
  Future<void> stop() async {
    await player.stop();
    currentURL = null;
    isPlaying = false;
  }

  /// mute
  Future<void> mute(double volume) async {
    currentVolume = volume;
    await player.setVolume(volume);
  }
}
