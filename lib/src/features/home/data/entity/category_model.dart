class CategoryModel{
  String? title;
  String? image;
  CategoryModel({this.image, this.title});

}

List <CategoryModel> categoryList  = [
  CategoryModel(title: "Clothes", image: "assets/images/clothes.png"),
  CategoryModel(title: "Dress", image: "assets/images/dress.png"),
  CategoryModel(title: "Pants", image: "assets/images/pants.png"),
  CategoryModel(title: "Suit", image: "assets/images/suit.png"),
  CategoryModel(title: "T-shirt", image: "assets/images/t_shirt.png"),
];