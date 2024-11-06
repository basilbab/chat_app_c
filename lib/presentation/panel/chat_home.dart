import 'package:chat_app_c/domain/chat_model.dart';
import 'package:flutter/material.dart';

class ScreenChatHome extends StatefulWidget {
  const ScreenChatHome({super.key});

  @override
  State<ScreenChatHome> createState() => _ScreenChatHomeState();
}

class _ScreenChatHomeState extends State<ScreenChatHome> {
  final chatMessageController = TextEditingController();
  List<ChatModel> chatModelList = [
    ChatModel(chatId: '1', chatMessage: 'Hai', chatStatus: '0', userId: '123'),
    ChatModel(
        chatId: '1',
        chatMessage: 'How do you do?',
        chatStatus: '0',
        userId: '123'),
    ChatModel(
        chatId: '1',
        chatMessage: 'How do you do????',
        chatStatus: '1',
        userId: '123'),
    ChatModel(
        chatId: '1', chatMessage: 'Ok bye..', chatStatus: '0', userId: '123'),
  ];
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: chatMessageController,
                      decoration: const InputDecoration(
                          hintText: 'Enter Chat Message...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // Write the code to add the chat message
                      },
                      child: Text('Add'))
                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          //Write code to change status
                        },
                        leading: Text((index + 1).toString()),
                        title: Text(chatModelList[index].chatMessage),
                        subtitle: Row(
                          children: [
                            Icon(
                              chatModelList[index].chatStatus == '0'
                                  ? Icons.pending_actions_rounded
                                  : Icons.check_circle_sharp,
                              color: chatModelList[index].chatStatus == '0'
                                  ? Colors.red
                                  : Colors.green,
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  //Write the code to delete chat
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: chatModelList.length,
                ))
          ],
        ),
      ),
    );
  }
}
