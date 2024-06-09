import 'package:flutter/material.dart';
import 'package:fluttertestapp/article_screen.dart';
import 'package:fluttertestapp/models/article.dart';

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
            return articleTile(article: articles[index]);
          },
        ),
      ],
    );
  }

  articleTile({required Article article}) => ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            article.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(article.title),
        subtitle: Text(article.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ArticleScreen(article: article),
            ),
          );
        },
      );
}
