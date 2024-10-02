import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';


class DetailsScreen extends StatelessWidget {
  final Article article;

  const DetailsScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final breed = article.breeds.isNotEmpty ? article.breeds[0] : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(breed?.name ?? 'Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение кошки
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  article.url,
                  width: 800,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Text(
              breed?.name ?? 'Unknown Breed',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),

            Text(
              'Temperament: ${breed?.temperament ?? 'No temperament available'}',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),


            Text(
              'Origin: ${breed?.origin ?? 'Unknown'}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),

            Text(
              'Life span: ${breed?.lifeSpan ?? 'No life span data available'}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),

            Text(
              'Description: ${breed?.description ?? 'No description data available'}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),



          ],
        ),
      ),
    );
  }
}
