import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class chatscreen extends StatefulWidget {
  final User user;
  const chatscreen({super.key, required this.user});

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  buildmessage(Message message, bool isme) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
              color: isme
                  ? Theme.of(context).hintColor
                  : const Color.fromARGB(225, 248, 119, 248),
              borderRadius: isme
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15))
                  : const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
          margin: isme
              ? const EdgeInsets.only(top: 8, bottom: 8, left: 80)
              : const EdgeInsets.only(top: 8, bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                message.text,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        !isme
            ? IconButton(
                onPressed: () {},
                icon: message.isLiked
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                iconSize: 30,
                color: message.isLiked
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  buildmessagecompusure() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      height: 70,
      color: Colors.white,
      child: Row(children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.photo),
          iconSize: 25,
          color: Colors.red,
        ),
        Expanded(
            child: TextField(
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.black),
            hintText: "send a message...",
          ),
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value) {},
        )),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send),
          iconSize: 25,
          color: Colors.red,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Center(
          child: Text(
            widget.user.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
            ),
            iconSize: 30,
            color: Colors.white,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ClipRect(
                  child: ListView.builder(
                    //reverse: true,
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isme = messages[index].sender.id == currentUser.id;
                      final Message message = messages[index];
                      return buildmessage(message, isme);
                    },
                  ),
                ),
              ),
            ),
            buildmessagecompusure(),
          ],
        ),
      ),
    );
  }
}
