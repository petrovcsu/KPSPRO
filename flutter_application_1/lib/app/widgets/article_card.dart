import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:flutter_application_1/app/app.dart'; //!!!
import 'package:flutter_application_1/domain/repository/model/article.dart';

class ArticleCard extends StatelessWidget {
    
  const ArticleCard({
    super.key,
    required this.article, // Добавляем параметр
  });

  final Article article; // Добавляем это поле

  @override
  Widget build(BuildContext context) {
    final breed = article.breeds.isNotEmpty ? article.breeds[0] : null;

    return InkWell(
      onTap: () {
        context.go(
          '/home/article/${article.id}',
          extra: article,  
        );
      },
      
      borderRadius: BorderRadius.circular(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              article.url,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  breed?.name ?? 'No breed name',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  breed?.temperament ?? 'No temperaments available', 
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
