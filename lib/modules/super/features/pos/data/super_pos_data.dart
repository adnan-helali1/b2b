class SuperPosProduct {
  final String name;
  final String category;
  final String supplier;
  final String price;
  final String stockLabel;
  final String imagePath;

  const SuperPosProduct({
    required this.name,
    required this.category,
    required this.supplier,
    required this.price,
    required this.stockLabel,
    required this.imagePath,
  });
}

const superPosProducts = <SuperPosProduct>[
  SuperPosProduct(
    name: 'طماطم طازجة',
    category: 'خضروات',
    supplier: 'مزارع الخير',
    price: '15 ر.س',
    stockLabel: 'كغ 47',
    imagePath: 'assets/images/tomato.jfif',
  ),
  SuperPosProduct(
    name: 'حليب كامل الدسم',
    category: 'ألبان',
    supplier: 'الألبان الوطنية',
    price: '12 ر.س',
    stockLabel: 'لتر 55',
    imagePath: 'assets/images/oil.jfif',
  ),
  SuperPosProduct(
    name: 'خبز أبيض',
    category: 'مخبوزات',
    supplier: 'بقالة الممتازة',
    price: '3.5 ر.س',
    stockLabel: 'رغيف 120',
    imagePath: 'assets/images/rise.jfif',
  ),
  SuperPosProduct(
    name: 'أرز بسمتي',
    category: 'حبوب',
    supplier: 'بقالة الممتازة',
    price: '18 ر.س',
    stockLabel: 'كغ 90',
    imagePath: 'assets/images/rise.jfif',
  ),
  SuperPosProduct(
    name: 'كيك فانيلا',
    category: 'حلويات',
    supplier: 'مزارع الخير',
    price: '8 ر.س',
    stockLabel: 'علبة 68',
    imagePath: 'assets/images/oil.jfif',
  ),
  SuperPosProduct(
    name: 'جبنة بيضاء',
    category: 'ألبان',
    supplier: 'الألبان الوطنية',
    price: '45 ر.س',
    stockLabel: 'كغ 24',
    imagePath: 'assets/images/chicken.jfif',
  ),
  SuperPosProduct(
    name: 'خيار',
    category: 'خضروات',
    supplier: 'مزارع الخير',
    price: '10 ر.س',
    stockLabel: 'كغ 28.5',
    imagePath: 'assets/images/tomato.jfif',
  ),
  SuperPosProduct(
    name: 'زيت زيتون',
    category: 'بقالة',
    supplier: 'بقالة الممتازة',
    price: '35 ر.س',
    stockLabel: 'لتر 25',
    imagePath: 'assets/images/oil.jfif',
  ),
];
