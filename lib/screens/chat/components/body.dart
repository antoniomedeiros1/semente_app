import 'dart:async';
import 'package:firebase_auth_db/services/functions.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_stream/sound_stream.dart';
import 'package:firebase_auth_db/constants.dart';
import 'package:firebase_auth_db/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import 'message.dart';

class Body extends StatefulWidget {
  final bool? help;

  const Body({Key? key, @required this.help})
      : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final List<ChatMessage> chatMessages = <ChatMessage>[];
  final functions = CloudFunctions();

  bool _isRecording = false;

  final RecorderStream _recorder = RecorderStream();
  late StreamSubscription _recorderStatus;
  late StreamSubscription<List<int>>? _audioStreamSubscription;
  late BehaviorSubject<List<int>> _audioStream;

  final TextEditingController _textController = TextEditingController();

  void addTextMessage(String text, bool isSender) {
    setState(() {
      chatMessages.add(
        ChatMessage(
          text: text,
          messageType: ChatMessageType.text,
          isSender: isSender
        )
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  @override
  void dispose() {
    _recorderStatus.cancel();
    _audioStreamSubscription?.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    _recorderStatus = _recorder.status.listen((status) {
      if (mounted)
        setState(() {
          _isRecording = status == SoundStreamStatus.Playing;
        });
    });

    await Future.wait([_recorder.initialize()]);

    // // Get a Service account
    // final serviceAccount = ServiceAccount.fromString(
    //     '${(await rootBundle.loadString('assets/credentials.json'))}');
    // // Create a DialogflowGrpc Instance
    // dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  void stopStream() async {
    print('Stop Stream');
    await _recorder.stop();
    await _audioStreamSubscription?.cancel();
    await _audioStream.close();
  }

  void handleSubmitted(String text) async {
    // print(text);
    _textController.clear();

    if (text.isNotEmpty) {

      addTextMessage(text, true);

      final response = await functions.dialogflowMessage("foo", text);

      addTextMessage(response?.message ?? 'Desculpe, houve um problema.', false);

    }
  }

  void handleStream() async {
    print('Handle Stream');
    _recorder.start();

    _audioStream = BehaviorSubject<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((data) {
      print(data);
      _audioStream.add(data);
    });
    //
    // // TODO Create SpeechContexts
    // // Create an audio InputConfig
    // var biasList = SpeechContextV2Beta1(phrases: [
    //   'Dialogflow CX',
    //   'Dialogflow Essentials',
    //   'Action Builder',
    //   'HIPAA'
    // ], boost: 20.0);
    //
    // // See: https://cloud.google.com/dialogflow/es/docs/reference/rpc/google.cloud.dialogflow.v2#google.cloud.dialogflow.v2.InputAudioConfig
    // var config = InputConfigV2beta1(
    //     encoding: 'AUDIO_ENCODING_LINEAR_16',
    //     languageCode: 'pt-BR',
    //     sampleRateHertz: 16000,
    //     singleUtterance: false,
    //     speechContexts: [biasList]);
    //
    // // TODO Make the streamingDetectIntent call, with the InputConfig and the audioStream
    // final responseStream =
    // dialogflow?.streamingDetectIntent(config, _audioStream);
    // // TODO Get the transcript and detectedIntent and show on screen
    // // Get the transcript and detectedIntent and show on screen
    // responseStream?.listen((data) {
    //   //print('----');
    //   setState(() {
    //     //print(data);
    //     String transcript = data.recognitionResult.transcript;
    //     String queryText = data.queryResult.queryText;
    //     String fulfillmentText = data.queryResult.fulfillmentText;
    //
    //     if (fulfillmentText.isNotEmpty) {
    //       ChatMessage message = new ChatMessage(
    //         text: queryText,
    //         name: "Você",
    //         type: true,
    //       );
    //
    //       ChatMessage botMessage = ChatMessage(
    //         text: fulfillmentText,
    //         name: "AmBot",
    //         type: false,
    //       );
    //
    //       _messages.insert(0, message);
    //       _textController.clear();
    //       _messages.insert(0, botMessage);
    //
    //       botspeak(fulfillmentText);
    //     }
    //     if (transcript.isNotEmpty) {
    //       _textController.text = transcript;
    //     }
    //   });
    // }, onError: (e) {
    //   //print(e);
    // }, onDone: () {
    //   //print('done');
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (chatMessages.isEmpty) {
      String? firstMessage;
      if(widget.help!) {
        firstMessage = "Olá! Sou o Semente, um chat bot inteligente, e quero te conhecer mais para poder te ajudar! Você pode me contar seu nome, idade e cidade de origem?";
      } else {
        firstMessage = "Olá! Sou o Semente, um chat bot inteligente, e agradeço pela sua ajuda! Para começar, você pode me contar seu nome, idade e cidade de origem?";
      }
      addTextMessage(firstMessage, false);
    }

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: chatMessages[index]),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xFF087949).withOpacity(0.08),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                Listener(
                  onPointerDown: (details) {
                    handleStream();
                  },
                  onPointerUp: (details) {
                    stopStream();
                  },
                  child: FloatingActionButton (
                    onPressed: () {},
                    backgroundColor: kPrimaryColor,
                    child: Icon(Icons.mic, color: Colors.white),
                  ),
                ),
                SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            onSubmitted: handleSubmitted,
                            decoration: InputDecoration(
                              hintText: "Escreva uma mensagem",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          color: kPrimaryColor,
                          icon: Icon(Icons.send),
                          onPressed: () => {
                            handleSubmitted(_textController.text),
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
