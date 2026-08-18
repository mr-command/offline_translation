import 'package:google_mlkit_translation/google_mlkit_translation.dart';

Future<String> translate(String greet) async {
  
  final translator = OnDeviceTranslator(
    sourceLanguage: TranslateLanguage.english,
    targetLanguage: TranslateLanguage.persian,
  );

  final result = await translator.translateText(
    greet,
  );

  print(result);

  await translator.close();

  return result;
}