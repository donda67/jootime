import 'dart:convert';
import 'package:http/http.dart' as http;

class AIAssistantService {
  // Для локального Ollama используйте: http://localhost:11434 (для веб)
  // или http://192.168.X.X:11434 (для телефона, замените на IP вашего ПК)
  static const String ollamaUrl = 'http://localhost:11434';
  static const String ollamaModel =
      'Qwen2.5:latest'; // или другая модель: mistral, neural-chat и т.д.

  final String prompt;

  AIAssistantService(this.prompt);

  Future<String> getResponse() async {
    return _getOllamaResponse(prompt);
  }

  Future<String> _getOllamaResponse(String prompt) async {
    final url = Uri.parse('$ollamaUrl/api/generate');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'model': ollamaModel,
      'prompt': prompt,
      'stream': false,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is Map &&
            data['response'] is String &&
            data['response'].isNotEmpty) {
          return data['response'];
        }
        return 'Пустой ответ от Ollama';
      }
      return 'Ошибка Ollama: ${response.statusCode} - ${response.body}';
    } catch (e) {
      return 'Ошибка подключения к Ollama ($ollamaUrl): $e\n\nУбедитесь, что:\n1. Ollama запущен\n2. Модель загружена (ollama pull $ollamaModel)\n3. Если на телефоне - используйте IP вашего ПК вместо localhost';
    }
  }
}
