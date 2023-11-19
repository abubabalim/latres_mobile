class MenuItemModel {
  final String img;
  final String title;
  final String description;

  MenuItemModel({
    required this.img,
    required this.title,
    required this.description,
  });
}

List<MenuItemModel> menuItems = [
  MenuItemModel(
    img: 'assets/news.svg',
    title: 'news',
    description: 'Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
  ),
  MenuItemModel(
    img: 'assets/blogs.svg',
    title: 'blogs',
    description: 'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast',
  ),
  MenuItemModel(
    img: 'assets/reports.svg',
    title: 'reports',
    description: 'Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!',
  ),
];
