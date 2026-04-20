import 'dart:convert';
import 'package:http/http.dart' as http;

class AIAssistantService {
  // Вставьте сюда ваш ключ Google Generative API.
  // Если хотите использовать другой сервис, замените URL и заголовки.
  static const String apiKey = 'AIzaSyCP3FrypMbL59NONLHMxcm6-n6UUAm3y5U';

  final String prompt;

  AIAssistantService(this.prompt);

  Future<String> getResponse() async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generate?key=$apiKey',
    );
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'prompt': {'text': prompt},
      'temperature': 0.7,
      'maxOutputTokens': 256,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is Map &&
            data['candidates'] is List &&
            data['candidates'].isNotEmpty) {
          return data['candidates'][0]['output'] ?? 'Пустой ответ от API';
        }
        return 'Неожиданный формат ответа от API';
      }
      return 'Ошибка Google API: ${response.statusCode} - ${response.body}';
    } catch (e) {
      return 'Ошибка сети: $e';
    }
  }
}
