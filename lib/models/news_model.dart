class NewsModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  NewsModel({this.count, this.next, this.previous, this.results});

  NewsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  String? updatedAt;
  bool? featured;
  List<Launches>? launches;
  List<Events>? events;

  Results(
      {this.id,
        this.title,
        this.url,
        this.imageUrl,
        this.newsSite,
        this.summary,
        this.publishedAt,
        this.updatedAt,
        this.featured,
        this.launches,
        this.events});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
    newsSite = json['news_site'];
    summary = json['summary'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    featured = json['featured'];
    if (json['launches'] != null) {
      launches = <Launches>[];
      json['launches'].forEach((v) {
        launches!.add(Launches.fromJson(v));
      });
    }
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['image_url'] = imageUrl;
    data['news_site'] = newsSite;
    data['summary'] = summary;
    data['published_at'] = publishedAt;
    data['updated_at'] = updatedAt;
    data['featured'] = featured;
    if (launches != null) {
      data['launches'] = launches!.map((v) => v.toJson()).toList();
    }
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Launches {
  String? launchId;
  String? provider;

  Launches({this.launchId, this.provider});

  Launches.fromJson(Map<String, dynamic> json) {
    launchId = json['launch_id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['launch_id'] = launchId;
    data['provider'] = provider;
    return data;
  }
}

class Events {
  int? eventId;
  String? provider;

  Events({this.eventId, this.provider});

  Events.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event_id'] = eventId;
    data['provider'] = provider;
    return data;
  }
}
