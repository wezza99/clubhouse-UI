import 'package:chat_ui/models/message_model.dart';
import 'package:chat_ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class rescentchats extends StatefulWidget {
  const rescentchats({super.key});

  @override
  State<rescentchats> createState() => _rescentchatsState();
}

// ignore: camel_case_types
class _rescentchatsState extends State<rescentchats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => chatscreen(
                          user: chats[index].sender,
                        ),),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  right: 5,
                ),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                    color:
                        chats[index].unread ? const Color(0XFFFFEFEE) : Colors.white),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(chats[index].sender.imageUrl),
                            radius: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chats[index].sender.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                child: Text(
                                  chats[index].text,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                      ]),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              chats[index].time,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            chats[index].unread
                                ? Container(
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "New",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : const Text(""),
                          ],
                        ),
                      )
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
