import 'dart:convert';
import 'package:firebase_auth_db/models/ChatMessage.dart';
import 'package:http/http.dart' as http;

class CloudFunctions {

  CloudFunctions();

  Future<ChatMessage?> dialogflowMessage(String sessionId, String message) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://10.0.2.2:5001/semente-85f18/us-central1/dialogflowGateway'));
    request.body = json.encode({
      "sessionId": sessionId,
      "queryInput": {
        "text": {
          "text": message,
          "languageCode": "pt-br"
        }
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print((json.decode(await response.stream.bytesToString()))['fulfillmentMessages'][0]['text']['text']);
      return ChatMessage.fromBot(json.decode(await response.stream.bytesToString())['fulfillmentMessages'][0]['text']['text'][0]);
    }
    else {
      throw Exception('Falha ao conectar ao chatbot');
    }
  }


}
