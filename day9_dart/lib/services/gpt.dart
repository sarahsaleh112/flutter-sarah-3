import 'package:http/http.dart' as http;
import 'dart:convert';
class Gpt {
Future<String> getData(String prompt) async {
String link = "https://api.openai.com/v1/chat/completions";
var uri = Uri.parse(link);

var header = {
"Content-Type": "application/json" ,
"Authorization":
 "Bearer "

};
var body = {

        "model": "gpt-4o-mini",
        "messages": [
            {
                "role": "system",
                "content": "You are a helpful assistant."
            },
            {
                "role": "user","content": prompt }
        ]
    
};

var request = await http.post(uri, headers:header ,body:json.encode(body), );
var response = json.decode(request.body);
String content = response ["choices"][0] ["message"]["content"];
return content;
}
}