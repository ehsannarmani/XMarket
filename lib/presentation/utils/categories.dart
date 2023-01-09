class ProductCategories{
  static List<Category> mainCategories = [
    Category(1,94, "موبایل و کالای دیجیتال"),
    Category(2,99, "لپ تاپ و کامپیوتر اداری"),
    Category(3,140, "هایپر مارکت"),
    Category(4,154, "پوشاک"),
    Category(5,129, "لوازم خانگی"),
    Category(6,2638, "زیبایی و بهداشت"),
    Category(7,163, "صوتی تصویری"),
    Category(8,112, "کودک و نوزاد"),
  ];
}
class Category{
  int sort;
  int id;
  String name;
  Category(this.sort,this.id,this.name);
}