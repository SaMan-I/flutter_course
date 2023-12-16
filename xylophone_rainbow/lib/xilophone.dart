import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Xilophone extends StatefulWidget {
  const Xilophone({super.key});

  @override
  State<Xilophone> createState() => _XilophoneState();
}

class _XilophoneState extends State<Xilophone> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5,
      ),
      body: Column(
        children: [
          AudioItem(
            player: player,
            color: const Color(0xffEF443A),
            note: 'noteC',
          ),
          AudioItem(
            player: player,
            color: const Color(0xffF99700),
            note: 'noteD',
          ),
          AudioItem(
            player: player,
            color: const Color(0xffFFE93B),
            note: 'noteE',
          ),
          AudioItem(
            player: player,
            color: const Color(0xff4CB050),
            note: 'noteF',
          ),
          AudioItem(
            player: player,
            color: const Color(0xff2E968C),
            note: 'noteG',
          ),
          AudioItem(
            player: player,
            color: const Color(0xff2996F5),
            note: 'noteA',
          ),
          AudioItem(
            player: player,
            color: const Color(0xff9B28B1),
            note: 'noteB',
          ),
        ],
      ),
      bottomNavigationBar: const SizedBox(height: 70),
    );
  }
}

class AudioItem extends StatelessWidget {
  const AudioItem({
    super.key,
    required this.player,
    required this.color,
    required this.note,
  });

  final AudioPlayer player;
  final Color color;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          player.play(AssetSource('audios/$note.mp3'));
        },
        child: Container(color: color),
      ),
    );
  }
}
