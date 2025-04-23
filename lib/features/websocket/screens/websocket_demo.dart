import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketDemo extends StatefulWidget {
  const WebsocketDemo({super.key});

  @override
  State<WebsocketDemo> createState() => _WebsocketDemoState();
}

class _WebsocketDemoState extends State<WebsocketDemo> {
  final wsUrl = Uri.parse("wss://ws.ifelse.io");
  //final wsUrl = Uri.parse("wss://echo.websocket.org");
  late final WebSocketChannel chanel;

  final TextEditingController textController = TextEditingController();
  final messages = [];

  @override
  void initState() {
    super.initState();
    chanel = WebSocketChannel.connect(wsUrl);
  }

  void sendMessage() {
    chanel.sink.add(textController.text.trim());
    textController.clear();
  }

  @override
  void dispose() {
    chanel.sink.close();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WebSocket Demo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(hintText: "Send message here..."),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      sendMessage();
                    }
                  },
                  child: const Text("Send"),
                ),
              ],
            ),
            StreamBuilder(
              stream: chanel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  messages.add(snapshot.data);
                }
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(messages[index]),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
