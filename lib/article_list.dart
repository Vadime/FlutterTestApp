import 'package:flutter/material.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final List<Article> articles;

  @override
  void initState() {
    articles = [
      const Article(
        image: 'assets/images/test1.jpg',
        title: 'Article 1',
        description: 'This is the first article.',
      ),
      const Article(
        image: 'assets/images/test2.jpg',
        title: 'Article 2',
        description: 'This is the second article.',
      ),
      const Article(
        image: 'assets/images/test3.png',
        title: 'Article 3',
        description: 'This is the third article.',
      ),
      // Add more articles here
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Articles',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(
                articles[index].image,
                width: 50,
                height: 50,
              ),
              title: Text(articles[index].title),
              subtitle: Text(articles[index].description),
            );
          },
        ),
      ],
    );
  }
}

class Article {
  final String image;
  final String title;
  final String description;

  const Article({
    required this.image,
    required this.title,
    required this.description,
  });
}
