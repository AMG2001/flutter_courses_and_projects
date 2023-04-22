import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerController {
  AudioPlayerController._privateConstructor();

  static final AudioPlayerController _instance =
      AudioPlayerController._privateConstructor();

  static AudioPlayerController get instance => _instance;

  final player = AudioPlayer();

  void playSuccessSound() async {
    await player.play(AssetSource('audios/success_audio.mp3'));
  }

  void playFailSound() async {
    await player.play(AssetSource('audios/fail_audio.mp3'));
  }
}
