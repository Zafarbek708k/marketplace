import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/t_shirt.png'), // Replace with user's avatar
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Angie Brekke', style: TextStyle(color: Colors.white)),
                Text('Online', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options button press
            },
          ),
        ],
        backgroundColor: Colors.brown, // Customize the color
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ChatBubble(
                  text: 'Lorem Ipsum is simply dummy text of the printing\n and typesetting industry.',
                  isSender: true,
                  time: '08:04 pm',
                ),
                const SizedBox(height: 16),
                ChatBubble(
                  text: 'Lorem Ipsum is simply dummy\n text of the printing and\n typesetting industry.',
                  isSender: false,
                  time: '08:04 pm',
                  senderAvatar: const AssetImage('assets/images/suit.png'),
                ),
                const SizedBox(height: 16),
                ImageBubble(
                  imageUrl: 'assets/images/clothes.png', // Replace with image path or network image
                  isSender: true,
                  time: '08:04 pm',
                ),
                const SizedBox(height: 16),
                AudioBubble(
                  audioUrl: 'assets/sample_audio.mp3', // Replace with audio file path
                  isSender: false,
                  time: '08:04 pm',
                  senderAvatar: const AssetImage('assets/images/suit.png'),
                ),
              ],
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final String time;
  final ImageProvider? senderAvatar;

  const ChatBubble({super.key,
    required this.text,
    required this.isSender,
    required this.time,
    this.senderAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender && senderAvatar != null) CircleAvatar(backgroundImage: senderAvatar),
        if (!isSender) const SizedBox(width: 8),
        Column(
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding:  REdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSender ? Colors.brown : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(text, style: TextStyle(color: isSender ? Colors.white : Colors.black)),
            ),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class ImageBubble extends StatelessWidget {
  final String imageUrl;
  final bool isSender;
  final String time;

  ImageBubble({
    required this.imageUrl,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender) const SizedBox(width: 40), // Adjust for avatar space
        Column(
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imageUrl, width: 200), // Use NetworkImage for online images
            ),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class AudioBubble extends StatelessWidget {
  final String audioUrl;
  final bool isSender;
  final String time;
  final ImageProvider? senderAvatar;


  AudioBubble({
    required this.audioUrl,
    required this.isSender,
    required this.time,
    this.senderAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender && senderAvatar != null) CircleAvatar(backgroundImage: senderAvatar),
        if (!isSender) const SizedBox(width: 8),
        Column(
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSender ? Colors.brown : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.play_arrow, color: isSender ? Colors.white : Colors.black),
                    onPressed: () async {
                    },
                  ),
                  const SizedBox(width: 8),
                  Text('0:13', style: TextStyle(color: isSender ? Colors.white : Colors.black)),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Handle add button press
            },
          ),
          Expanded(
            child: TextField(
              onTapOutside: (v){
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Type a message here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.mic),
            onPressed: () {
              // Handle mic button press
            },
          ),
        ],
      ),
    );
  }
}
