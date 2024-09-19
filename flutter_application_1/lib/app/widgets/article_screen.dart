import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final String articleId;

  const ArticleScreen({
    super.key,
    required this.articleId,
  });

  @override
  Widget build(BuildContext context) {
     // Получение данных статьи по ее id
    final article = _getArticleById(articleId);

    return Scaffold(
      // Верхняя панель с заголовком, использующим id статьи
      appBar: AppBar(
        title: Text(articleId),
      ),
      body: Padding(
        // Отступы вокруг контента экрана
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок статьи
            Text(
              article['title'] ?? 'Title not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            // Изображение статьи
            Image.asset(
              'assets/images/yt.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Описание статьи
            Text(
              article['description'] ?? 'Description not found',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  // Метод для получения данных статьи по id
  Map<String, String> _getArticleById(String id) {
    return {
      'title': id,
      'description': 'This is the detailed description of article $id.',
    };
  }
}
