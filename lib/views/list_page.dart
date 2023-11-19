import 'package:flutter/material.dart';
import 'package:latres_mobile/models/blogs_model.dart';
import 'package:latres_mobile/models/news_model.dart';
import 'package:latres_mobile/models/reports_model.dart';
import 'package:latres_mobile/services/api_data_source.dart';
import 'package:latres_mobile/views/detail_page.dart';

class ListPage extends StatefulWidget {
  final String title;

  const ListPage({super.key, required this.title});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    var endpoint = widget.title == 'news' ? 'articles' : widget.title;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.title.toUpperCase()} LIST'),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadList(endpoint),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (widget.title == 'news') {
              NewsModel news = NewsModel.fromJson(snapshot.data!);
              return _buildNews(news);
            } else if (widget.title == 'blogs') {
              BlogsModel blogs = BlogsModel.fromJson(snapshot.data!);
              return _buildBlogs(blogs);
            } else {
              ReportsModel reports = ReportsModel.fromJson(snapshot.data!);
              return _buildReports(reports);
            }
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildNews(NewsModel news) {
    return ListView.builder(
      itemCount: news.results!.length,
      itemBuilder: (context, index) {
        var item = news.results![index];
        return _buildItemList(
          item.imageUrl!,
          item.title!,
          item.summary!,
          item.url!,
        );
      },
    );
  }

  Widget _buildBlogs(BlogsModel blogs) {
    return ListView.builder(
      itemCount: blogs.results!.length,
      itemBuilder: (context, index) {
        var item = blogs.results![index];
        return _buildItemList(
          item.imageUrl!,
          item.title!,
          item.summary!,
          item.url!,
        );
      },
    );
  }

  Widget _buildReports(ReportsModel reports) {
    return ListView.builder(
      itemCount: reports.results!.length,
      itemBuilder: (context, index) {
        var item = reports.results![index];
        return _buildItemList(
          item.imageUrl!,
          item.title!,
          item.summary!,
          item.url!,
        );
      },
    );
  }

  Widget _buildItemList(
      String img, String title, String summary, String newsUrl) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(
              type: widget.title,
              title: title,
              imgUrl: img,
              summary: summary,
              newsUrl: newsUrl,
            ),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                img,
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
