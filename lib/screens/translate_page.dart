import 'package:flutter/material.dart';
import 'package:mmd_translate/logic/translation.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  final TextEditingController translateController = TextEditingController();

  String translatedText = '';
  bool isLoading = false;

  Future<void> doTranslate() async {
    if (translateController.text.trim().isEmpty) return;

    setState(() {
      isLoading = true;
    });

    try {
      final result = await translate(translateController.text);

      setState(() {
        translatedText = result;
      });
    } catch (e) {
      setState(() {
        translatedText = 'خطا در ترجمه: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    translateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "مترجم آفلاین",
              style: TextStyle(
                fontFamily: "Estedad",
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              "ممد ترنسلیت",
              style: TextStyle(
                fontFamily: "Estedad",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              maxLines: 20,
              minLines: 10,
              controller: translateController,
              decoration: InputDecoration(
                hintText: "متن رو وارد کن",
                hintStyle: TextStyle(
                  fontFamily: "Estedad",
                  fontSize: 16,
                  color: Colors.deepPurple,
                ),
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextButton(
              onPressed: isLoading ? null : doTranslate,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(
                      "ترجمه",
                      style: TextStyle(
                        fontFamily: "Estedad",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
            ),

            const SizedBox(height: 20),

            if (translatedText.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  translatedText,
                  style: const TextStyle(
                    fontFamily: "Estedad",
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}