import 'package:flutter/material.dart';

class ChatModel {
  final String message;
  final DateTime datetime;
  final bool isSentByme;

  ChatModel(
      {required this.message,
      required this.datetime,
      required this.isSentByme});
}

Widget showChat(ChatModel chatModel) {
  return Container(
    margin: const EdgeInsets.all(10),
    alignment:
        chatModel.isSentByme ? Alignment.bottomRight : Alignment.bottomLeft,
    child: chatModel.isSentByme
        ? ListTile(
            leading: const Text("20:00"),
            title: Container(
              width: 180,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Color.fromRGBO(190, 215, 210, 0.2),
              ),
              child: Text(chatModel.message),
            ),
          )
        : ListTile(
            leading: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                "assets/avatarImage.jpg",
                scale: 12,
              ),
            ),
            title: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color.fromRGBO(210, 215, 210, 0.3),
              ),
              child: Text(chatModel.message),
            ),
            trailing: const Text("20:00"),
          ),
  );
}
