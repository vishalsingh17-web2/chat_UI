import 'package:chat/Models/chat_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

List<ChatModel> currChat = [
  ChatModel(
    datetime: DateTime.now(),
    isSentByme: false,
    message: 'Hey there, what\'s up!',
  ),
  ChatModel(
    datetime: DateTime.now(),
    isSentByme: true,
    message: 'Nothing. Just chilling and watching Youtube. What about you',
  ),
  ChatModel(
    datetime: DateTime.now(),
    isSentByme: false,
    message:
        'Same here! Been watching YouTube for the past 5 hours despite of having so much to do!',
  ),
  ChatModel(
    datetime: DateTime.now(),
    isSentByme: true,
    message: 'Yeah I know, I\'m in the same position',
  ),
];
List<Widget> show = [
  showChat(currChat[0]),
  showChat(currChat[1]),
  showChat(currChat[2]),
  showChat(currChat[3]),
];

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("--------------------Build-----------------------");

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 91, 97, 185),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      width: MediaQuery.of(context).size.width * 0.43,
                      child: const Text(
                        "Tannaz Sadeghi",
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      width: MediaQuery.of(context).size.width * 0.41,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white30,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.call_outlined),
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white30,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.video_call_sharp),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 45),
              Container(
                height: MediaQuery.of(context).size.height * 0.72,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7 * 0.87,
                      child: ListView.builder(
                        itemCount: show.length,
                        itemBuilder: (context, index){
                          return show[index];
                        }
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.7 * 0.13,
                      child: ListTile(
                        title: TextFormField(
                          controller: _message,
                          cursorColor: const Color.fromARGB(255, 91, 97, 185),
                          decoration: const InputDecoration.collapsed(
                            hintText: "Type your message..",
                          ),
                        ),
                        trailing: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 91, 97, 185),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              ChatModel now = ChatModel(
                                  message: _message.text,
                                  datetime: DateTime.now(),
                                  isSentByme: true);
                              if (_message.text.isNotEmpty) {
                                _message.clear();
                                setState(() {
                                  show.add(showChat(now));
                                });
                              }
                            },
                            icon: const Icon(Icons.send),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
