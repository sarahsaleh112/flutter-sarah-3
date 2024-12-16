import 'package:dash_chat_2/dash_chat_2.dart';
import "package:day9_dart/services/gpt.dart";
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
 ChatUser me =ChatUser(id: "1");
ChatUser bot =ChatUser(id: "2");

List<ChatMessage> messageList= [];
 
@override
Widget build (BuildContext context){
return Scaffold(
  body: DashChat(
    currentUser: me, 
    onSend: (newMessage) async{
    messageList.insert(0, newMessage);
    setState(() { });

    String content = await Gpt().getData(newMessage.text);
    ChatMessage botMessage = ChatMessage(
      user: bot,
      createdAt: DateTime.now(),
      text: content,
    );
messageList.insert(0, botMessage);
setState(() {
});
  }, messages:messageList ),

);
}

  }
