import 'dart:math';

import 'package:faker/faker.dart';
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
    articles = generateArticleList(100);
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

  articleTile({required Article article}) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          tileColor: Colors.white,
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
        ),
      );

  List<Article> generateArticleList(int count) {
    List<Article> articles = [];

    // use faker package to generate random data
    for (int i = 0; i < count; i++) {
      articles.add(
        Article(
          image: 'assets/images/test${Random().nextInt(3) + 1}.jpg',
          title: faker.lorem.sentence(),
          description: faker.lorem.sentences(3).join(' '),
        ),
      );
    }

    return articles;
  }
}
