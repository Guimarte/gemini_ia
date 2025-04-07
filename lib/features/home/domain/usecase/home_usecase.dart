import 'package:flutter_gemini/flutter_gemini.dart';

abstract class GetGeminiAnswer {
  Future<String?> call({required String question});
}

class GetGeminiAnswerImplementation implements GetGeminiAnswer {
  @override
  Future<String?> call({required String question}) async {
    final value = await Gemini.instance.prompt(parts: [Part.text(question)]);
    print(value?.output);
    return value?.output;
  }
}
